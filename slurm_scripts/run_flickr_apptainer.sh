#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=v100l:1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=32G
#SBATCH --time=1-00:00
#SBATCH --account=def-lingjzhu

module load StdEnv/2023 apptainer/1.2.4
# set cache directory
# Please set all your cache directory to scratch. If you don't, cache files will be placed in your /home
export APPTAINER_CACHEDIR=/home/brdiep/scratch/cache/apptainer
export HF_DATASETS_CACHE=/home/brdiep/scratch/cache/huggingface
export TRANSFORMERS_CACHE=/home/brdiep/scratch/cache/huggingface

# remove --nv if you don't need a GPU
apptainer run -C --nv --home /project/6080355/brdiep/Semantic-Segment-Anything/home -W $SLURM_TMPDIR -B /home:/cluster_home -B /project -B /scratch ssa.sif bash /project/6080355/brdiep/Semantic-Segment-Anything/slurm_scripts/execute_flickr_job.sh