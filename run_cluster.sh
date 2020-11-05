#!/bin/bash

# SLURM SUBMIT SCRIPT
#SBATCH --job-name=HIDA-100
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=1
#SBATCH --time=08:00:00
#SBATCH --account=machnitz
#SBATCH --partition=pGPU
#SBATCH --exclusive


module load compilers/cuda/10.1
export CUDA_VISIBLE_DEVICES="0"
nvidia-smi
srun /gpfs/home/machnitz/miniconda3/envs/pytorch/bin/python main.py \
      --max_epochs 100 --gpus 1 --num_workers 20 \
      --batch_size 4 --learning_rate 0.0001 \
      --num_nodes 3 --distributed_backend "ddp"