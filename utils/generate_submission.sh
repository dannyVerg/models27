#!/bin/bash
export OC_DISABLE_DOT_ACCESS_WARNING=1

mmf_predict config=$3 \
    model="visual_bert" \
    dataset=hateful_memes \
    run_type=test \
    checkpoint.resume_file=$1 \
    checkpoint.reset.optimizer=True \
    dataset_config.hateful_memes.annotations.train[0]=$4 \
    dataset_config.hateful_memes.annotations.val[0]=$5 \
    dataset_config.hateful_memes.annotations.test[0]=$6 \
    dataset_config.hateful_memes.features.train[0]=$2 \
    dataset_config.hateful_memes.features.val[0]=$2 \
    dataset_config.hateful_memes.features.test[0]=$2 \
    env.save_dir="./save/preds"
