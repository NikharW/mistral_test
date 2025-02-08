#!/bin/bash

# We have 8 GPUs available, but we need only 4 for the current batch sizes.
batch_size=(250 250 500 1000)

for i in {0..3}; do
  CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]} MODEL_NUM=$i ./evaluate_memorization.sh &
done

wait  # Wait for all background processes to finish

echo "All evaluations completed."
