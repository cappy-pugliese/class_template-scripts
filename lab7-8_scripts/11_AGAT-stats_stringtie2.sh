#!/bin/bash
#SBATCH --job-name=AGAT-stats
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=2G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

### define files
GENOME=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/Group6.fasta
ANNOTATION=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC/new_stringtie2_2.gff

### go to folder
cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC

### load module
module load singularity

### run AGAT
singularity exec /isg/shared/databases/nfx_singularity_cache/depot.galaxyproject.org-singularity-agat-1.4.0--pl5321hdfd78af_0.img \
  agat_sp_statistics.pl \
  --gff $ANNOTATION \
  -o agat-stat_stringtie2

########### script end
