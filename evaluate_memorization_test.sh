#!/bin/bash

push_logs() {
    local batch_num=$1
    echo "Pushing logs for batch $batch_num to GitHub..."
    git add logs/
    git commit -m "Auto update results for batch $batch_num" || {
        echo "Git commit failed for batch $batch_num"
        return 1
    }
    git push -u origin main || {
        echo "Git push failed for batch $batch_num"
        return 1
    }
    echo "Successfully pushed logs for batch $batch_num"
}

# Step 1: Run batch_eval.py with the baseline config
echo "Running baseline batch evaluation..."
python batch_eval_test.py --model-config configs/model.json \
                    --quant-config configs/baseline-config.json \
                    --num-samples 10 \
                    --batch-size 3 \
                    --output-after-batch true \
                    --on-batch-complete "push_logs" || exit 1

# Step 2: Merge all JSON files into merged.json
echo "Merging all JSON files into merged.json..."
find . -name "summary.json" -type f -exec cat {} + | jq -s '.' > ./logs/merged.json
echo "Merged JSON files successfully."

echo "All evaluations completed."
echo "Begginnig github push..."
git remote -v
git add logs
git commit -m "Auto update results added" || echo "commit failed"
git push -u origin main || echo "git push failed"
