#!/bin/bash

batch_size=(2 2 2 2)

# Launch all evaluations in parallel
for i in {0..3}; do
    (
        CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]} MODEL_NUM=$i ./evaluate_memorization.sh
        git add --all
        git commit -m "Auto-update results from GPU $i"
        git remote add origin_2 https://${GITHUB_TOKEN}@github.com/NikharW/mistral_test.git
    ) &
done

# Wait for all background processes to complete
wait

echo "All evaluations completed and results pushed."
