#!/bin/bash
#SBATCH --nodes=1  
#SBATCH --ntasks-per-node=1
#SBATCH --mem=16G
#SBATCH --time=3-00:00
#SBATCH --account=def-lingjzhu

module load StdEnv/2023 apptainer/1.2.4 

apptainer shell -C --home /project/6080355/brdiep/Semantic-Segment-Anything/home -W $SLURM_TMPDIR -B /home:/cluster_home -B /project -B /scratch ssa.sif
conda env create -p /project/6080355/brdiep/Semantic-Segment-Anything/ssa -f /project/6080355/brdiep/Semantic-Segment-Anything/environment.yaml
