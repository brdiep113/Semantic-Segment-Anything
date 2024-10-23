#!/bin/bash
#SBATCH --nodes=1  
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16G
#SBATCH --time=3-00:00
#SBATCH --account=def-lingjzhu

module load StdEnv/2023 apptainer/1.2.4 

export APPTAINER_CACHEDIR=/home/brdiep/scratch/cache/apptainer

apptainer build ssa.sif docker://pytorch/pytorch:1.9.1-cuda11.1-cudnn8-devel