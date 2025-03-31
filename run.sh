#!/bin/bash

# Set distributed environment variables for a single-process setup
export MASTER_ADDR=localhost
export MASTER_PORT=29500
export RANK=0
export WORLD_SIZE=1

# Define fixed batch size in an array (only one value)
batch_size=(250)

# Launch evaluation process on GPU 0 (only one process)
for i in {0}; do
    (
        CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]} ./evaluate_memorization.sh
    ) &
done

# Wait for the background process to complete
wait

echo "All evaluations completed and results pushed."
