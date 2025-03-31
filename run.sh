#!/bin/bash

BATCH_SIZE = 250

CUDA_VISIBLE_DEVICES=0 ./evaluate_memorization.sh

# Wait for all background processes to complete
wait

echo "All evaluations completed and results pushed."
