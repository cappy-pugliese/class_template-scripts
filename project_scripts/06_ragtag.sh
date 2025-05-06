#!/bin/bash
#SBATCH --job-name=1rainbw-ragtag
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 20
#SBATCH --mem=60G
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

## load module
module load RagTag/2.1.0

## set paths
cd /home/FCAM/eeb5300/usr14/group_project/05_ragtag/02_rainbtrt-ref_ragtag/1rainbw_ragtag/

REF=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/01_ref-genomes/rainbtrt-ref.fna

QUERY=/home/FCAM/eeb5300/usr14/group_project/03_masurca/masurca_outputs/1mascura.fasta 

## start ragtag
ragtag.py scaffold $REF $QUERY \
  -t 20 \
  -f 1000 \
  --remove-small \
  -w \
  -o run2

########### script end
