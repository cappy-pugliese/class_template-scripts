#!/bin/bash
#SBATCH --job-name=kraken_fastqc
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=2G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=END
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

## load modules
module load fastqc/0.12.1
module load parallel/20180122

## set paths
INDIR=/home/FCAM/eeb5300/usr14/group_project/02_QC-and-contam/02_kraken
OUTDIR=/home/FCAM/eeb5300/usr14/group_project/02_QC-and-contam/01_fastqc/02_kraken-reads
ACCLIST=/home/FCAM/eeb5300/usr14/group_project/01_raw-data/02_illumina-data/accession-list.txt

cd $OUTDIR

## run fastqc
cat $ACCLIST | parallel -j 1 fastqc \
  -o $OUTDIR \
  -f fastq \
  $INDIR/{}_unclassified_1.fastq $INDIR/{}_unclassified_2.fastq

########### script end