#!/bin/bash
#SBATCH --job-name=fasterq_dump
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=25G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data

##################################
# Download fastq files from SRA 
##################################

# load parallel module
module load sratoolkit/3.0.1

# prefetch
vdb-config --prefetch-to-cwd

prefetch SRR19126251

# fasterq-dump
fasterq-dump --fasta --split-files SRR19126251

########### script end