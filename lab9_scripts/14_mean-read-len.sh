#!/bin/bash
#SBATCH --job-name=read_len
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
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

cd /home/FCAM/eeb5300/usr14/5300_labs/week10-class_portion/02_quality-control/02_fastp_reports

## loops confuse me sad face

touch mean_read_lengths.txt

grep -i "mean_length" SRR12475447_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' > mean_read_lengths.txt

grep -i "mean_length" SRR12475448_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475449_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475450_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475451_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475452_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475453_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475454_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475455_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475456_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475468_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475469_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475470_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475471_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475472_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475473_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475474_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475475_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

grep -i "mean_length" SRR12475476_fastp.json | awk 'NR==3{print} NR==4{print}' | awk -F ":" '{print $2}' | awk -F "," '{print $1}' >> mean_read_lengths.txt

########### script end

