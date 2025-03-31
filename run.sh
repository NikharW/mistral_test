#!/bin/bash
export MASTER_ADDR=localhost
export MASTER_PORT=29500
export RANK=0
export WORLD_SIZE=1
batch_size=(250 250)

# Launch all evaluations in parallel
for i in {0..1}; do
    (
        export MASTER_ADDR=localhost
        export MASTER_PORT=$((29500 + $i))
        export RANK=$i
        export WORLD_SIZE=2  # if you are running two processes in parallel    
        CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]} MODEL_NUM=$i ./evaluate_memorization.sh
    ) &
done
# Wait for all background processes to complete
wait
