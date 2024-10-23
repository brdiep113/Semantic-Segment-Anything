#!/bin/bash
#SBATCH --mem=64G
#SBATCH --gpus-per-node=v100l:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=8:00:00    
#SBATCH --mail-user=<brdiep@mail.ubc.ca>
#SBATCH --mail-type=ALL

cd ~/projects/def-lingjzhu/brdiep/Semantic-Segment-Anything

# Set up modules/virtual environment
module purge
module load StdEnv/2020 python/3.10 scipy-stack gcc cuda/11.0 opencv
source ~/py310/bin/activate

pip install mmcv-full -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.1/index.html
python scripts/main_ssa_engine.py --data_dir=~/scratch/Flickr8k_dataset --out_dir=~/scratch/Flickr8k_annotated --world_size=8 --save_img --sam --ckpt_path=ckp/sam_vit_h_4b8939.pth

