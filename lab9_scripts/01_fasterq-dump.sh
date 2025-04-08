#!/bin/bash
#SBATCH --job-name=fastqer_dump_xanadu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
#SBATCH --mem=15G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/01_raw-data/download_attempt2

##################################
# Download fastq files from SRA 
##################################

# load parallel module
module load parallel/20180122
module load sratoolkit/3.0.1

# The data are a subset (2 populations) from this study:
    # https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE156460

ACCLIST=../accessionlist.txt

cat $ACCLIST | parallel -j 2 fasterq-dump

# compress the files 
ls *fastq | parallel -j 12 gzip

########### script end
