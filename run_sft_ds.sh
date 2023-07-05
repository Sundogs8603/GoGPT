#deepspeed --num_gpus=8 train_sft.py \
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 torchrun --nproc_per_node 8 train_sft.py \
    --model_type llama \
    --model_name_or_path /data/searchgpt/pretrained_models/vicuna-13b-v1.3 \
    --tokenizer_name_or_path /data/searchgpt/pretrained_models/vicuna-13b-v1.3 \
    --train_file_dir data/finetune/opendata \
    --validation_file_dir data/finetune/opendata \
    --per_device_train_batch_size 1 \
    --per_device_eval_batch_size 1 \
    --do_train \
    --do_eval \
    --use_peft False \
    --fp16 \
    --max_train_samples 100000 \
    --max_eval_samples 1000 \
    --num_train_epochs 1 \
    --learning_rate 2e-5 \
    --warmup_ratio 0.05 \
    --weight_decay 0.05 \
    --logging_strategy steps \
    --logging_steps 10 \
    --eval_steps 100 \
    --evaluation_strategy steps \
    --save_steps 500 \
    --save_strategy steps \
    --save_total_limit 3 \
    --gradient_accumulation_steps 1 \
    --preprocessing_num_workers 1 \
    --max_source_length 256 \
    --max_target_length 512 \
    --output_dir outputs-sft-v1 \
    --overwrite_output_dir \
    --ddp_timeout 30000 \
    --logging_first_step True \
    --target_modules all \
    --torch_dtype bfloat16 \
    --device_map auto \
    --report_to tensorboard \
    --ddp_find_unused_parameters False \
    --gradient_checkpointing True \
    --deepspeed "./configs/deepspeed_config.json"
