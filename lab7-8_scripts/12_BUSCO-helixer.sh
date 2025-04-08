#!/bin/bash
#SBATCH --job-name=BUSCO
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
#SBATCH --mem=30G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC/03_busco

module load busco/5.4.5

OUTDIR=01_helixer
GENOME=/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7-8/03_annotationQC/01_protein-fasta/protein_helixer.fasta
DATABASE=/isg/shared/databases/BUSCO/odb10/lineages/embryophyta_odb10

busco \
    -i $GENOME \
    -o $OUTDIR \
    -l $DATABASE \
    -m proteins \
    -c 8 \
    -f

########### script end
