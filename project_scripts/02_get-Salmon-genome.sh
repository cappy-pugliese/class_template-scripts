#!/bin/bash
#SBATCH --job-name=wget_genome
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH --partition=mcbstudent
#SBATCH --qos=mcbstudent
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err

########### script start

hostname
date

cd /home/FCAM/eeb5300/usr14/group_project/01_raw-data

# get salmon reference genome

wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/021/399/835/GCA_021399835.1_USDA_NASsal_1.1/GCA_021399835.1_USDA_NASsal_1.1_genomic.fna.gz

########### script end