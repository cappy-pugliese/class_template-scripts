#!/bin/bash
#SBATCH --job-name=hisat2_index
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=10G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=caprina.pugliese@uconn.edu
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7/02_annotation/hisat2

#################################################################
# Index the Genome
#################################################################

module load hisat2/2.2.0

GENOME=/core/labs/Wegrzyn/EEB5300_test_assemblies/Group6.fasta


## create index

hisat2-build -p 4 $GENOME euc_index

########### script end
