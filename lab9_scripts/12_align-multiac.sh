#!/bin/bash
#SBATCH --job-name=multiqc
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
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

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/05_alignQC

#########################################
# Aggregate reports using MultiQC
#########################################

module load MultiQC/1.9

# run on samtool stats output
multiqc -f -o samtools_stats_multiqc samtools_stats

# run on qualimap output
multiqc -f -o qualimap_multiqc qualimap_reports

########### script end
