#!/bin/bash

batch_size=(250)

# Launch all evaluations in parallel
for i in {0}; do
    (
        CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]}  ./evaluate_memorization.sh
    ) &
done

# Wait for all background processes to complete
wait

echo "All evaluations completed and results pushed."
