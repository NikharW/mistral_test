#!/bin/bash

# Define fixed batch size
BATCH_SIZE=250

# Set environment variable and CUDA device for evaluate_memorization.sh
CUDA_VISIBLE_DEVICES=0 BATCH_SIZE=$BATCH_SIZE ./evaluate_memorization.sh

# Wait for all background processes to complete
wait

echo "All evaluations completed and results pushed."
