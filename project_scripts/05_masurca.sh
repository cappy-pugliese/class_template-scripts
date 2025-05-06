#!/bin/bash
#SBATCH --job-name=1Masurca
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 20
#SBATCH --mem=250G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=ryan.shirvell@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

hostname
date

# set paths
OUTDIR=/home/FCAM/eeb5300/usr14/group_project/03_masurca/1masurca
mkdir -p $OUTDIR
cp config.txt $OUTDIR
cd $OUTDIR

# load modules
module load MaSuRCA/4.0.5
module rm perl/5.24.0
module load perl/5.36.0

# run masurca
masurca config.txt

./assemble.sh