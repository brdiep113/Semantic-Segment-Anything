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
module load StdEnv/2020 python/3.8 cuda/11.1 opencv
virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate

pip install --no-index --upgrade pip
pip install torch==1.9.0
pip install torchvision==0.11.1 
pip install torchaudio==0.9.0
pip install transformers==4.27.4
pip install numpy==1.24.2
pip install mmcv-full==1.3.11
pip install mmsegmentation==0.26.0 
pip install mmdet==2.25.3 
pip install spacy[cuda] --no-index
python -m spacy download en_core_web_sm

pip freeze --local > requirements.txt

python scripts/main_ssa_engine.py --data_dir=~/scratch/Flickr8k_dataset --out_dir=~/scratch/Flickr8k_annotated --world_size=8 --save_img --sam --ckpt_path=ckp/sam_vit_h_4b8939.pth

