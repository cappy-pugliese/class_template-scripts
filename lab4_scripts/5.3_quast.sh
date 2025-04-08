#!/bin/bash
#SBATCH --job-name=QUAST
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 8
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

module load quast/5.2.0

OUTDIR="/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/05_assemblyQC/quast"
GENOME="/home/FCAM/eeb5300/usr14/5300_labs/5300_lab4/04_assembly/assembly.fasta"

quast.py $GENOME \
  -o $OUTDIR \
  -e \
  -t 8

########### script end
