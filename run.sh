#!/bin/bash

batch_size=(2 2 2 2)

for i in {0..3}; do
  CUDA_VISIBLE_DEVICES=$i BATCH_SIZE=${batch_size[$i]} MODEL_NUM=$i ./evaluate_memorization.sh &
  wait

  git add --all
  git commit -m "Auto-update results from iteration $i"
  git push https://github.com/NikharW/mistral_test.git main --force
done

echo "All evaluations completed and results pushed."
