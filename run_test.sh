#!/bin/bash

batch_size=$2
MODEL_CONFIG="configs/model.json"

echo "Running evaluation with batch size: $batch_size and model: $MODEL_CONFIG"
CUDA_VISIBLE_DEVICES=0 BATCH_SIZE=$batch_size MODEL_CONFIG=$MODEL_CONFIG ./evaluate_memorization_test.sh

echo "Evaluation completed."
