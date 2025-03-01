#!/bin/bash
#SBATCH --mem=64G
#SBATCH --gpus-per-node=v100l:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=8:00:00    
#SBATCH --mail-user=<brdiep@mail.ubc.ca>
#SBATCH --mail-type=ALL

conda init
source /project/6080355/brdiep/Semantic-Segment-Anything/home/.bashrc
conda activate /project/6080355/brdiep/Semantic-Segment-Anything/ssa

nvidia smi

python /project/6080355/brdiep/Semantic-Segment-Anything/scripts/main_ssa_engine.py --data_dir=~/scratch/Flickr8k_dataset --out_dir=~/scratch/Flickr8k_annotated --world_size=8 --save_img --sam --ckpt_path=ckp/sam_vit_h_4b8939.pth

