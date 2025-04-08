#!/bin/bash
#SBATCH --job-name=gtf_to_gff
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

#defined the files for my genome and the annotation files first

GENOME=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/Group6.fasta
GTF_ANNOTATION=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/02_annotation/05_stringtie/SRR22123167.gtf

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC

#This is called through a singularity container so I load this module
module load singularity

singularity exec /isg/shared/databases/nfx_singularity_cache/depot.galaxyproject.org-singularity-agat-1.4.0--pl5321hdfd78af_0.img \
  agat_convert_sp_gff2gtf.pl \
  --gff $GTF_ANNOTATION \
  -o new_stringtie2_2.gff


########### script end
