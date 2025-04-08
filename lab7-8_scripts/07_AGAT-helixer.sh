#!/bin/bash
#SBATCH --job-name=AGAT_helixer
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=5G
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
ANNOTATION=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/02_annotation/02_helixer/euc_pauciflora_helixer.gff3

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC

#This is called through a singularity container so I load this module
module load singularity

singularity exec /isg/shared/databases/nfx_singularity_cache/depot.galaxyproject.org-singularity-agat-1.4.0--pl5321hdfd78af_0.img agat_sp_extract_sequences.pl -g $ANNOTATION -f $GENOME -p -o protein_helixer.fasta

########### script end
