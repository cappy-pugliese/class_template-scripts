#!/bin/bash
#SBATCH --job-name=fasterq_dump
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
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

cd /home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/03_fasterq

##################################
# Download fastq files from SRA 
##################################

# load parallel module
module load parallel/20180122
module load sratoolkit/3.0.1

mkdir -p /home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/03_fasterq/tmp
export TMPDIR=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/03_fasterq/tmp

ACCLIST=../accession-list.txt

cat $ACCLIST | parallel -j 1 fasterq-dump






