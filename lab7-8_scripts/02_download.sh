#!/bin/bash
#SBATCH --job-name=euc_reads
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=20G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

module load sratoolkit/3.0.2

ILLUMINA=illumina
# mkdir -p ../${ILLUMINA}

cd ../${ILLUMINA}

fastq-dump --split-files SRR22123167

########### script end
