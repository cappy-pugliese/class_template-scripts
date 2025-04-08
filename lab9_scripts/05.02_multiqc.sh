#!/bin/bash
#SBATCH --job-name=multiqc
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 12
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

###########################################
# Aggregate reports using MultiQC
###########################################

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control

module load MultiQC/1.9

# run on fastp output
multiqc -f -o 04_fastp_multiqc 02_fastp_reports

# run on fastqc output
multiqc -f -o 05_fastqc_multiqc 03_fastqc_reports

########### script end
