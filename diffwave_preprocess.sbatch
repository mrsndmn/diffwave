#!/bin/env bash
#SBATCH --job-name="dffwv preprocess"
#SBATCH --ntasks=1              # Количество MPI процессов
#SBATCH --ntasks-per-node=1     # Количество процессов на один узел
#SBATCH --cpus-per-task=8       # Количество ядер CPU, выделенных для одного процесса
#SBATCH --gpus-per-node=1       # Количество GPU на один узел
#SBATCH -C type_a|type_b|type_c
#SBATCH --time-min=120

module purge
module load Python

source deactivate
source activate audio_dalle2
nvidia-smi

set -eo pipefail
set -o xtrace

#Executable

export PYTHONPATH=/home/dtarasov/workspace/hse-audio-dalle2/diffwave/src

srun python3 -m diffwave.preprocess ../data/audiocaps_train
