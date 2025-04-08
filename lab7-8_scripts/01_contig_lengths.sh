#!/bin/bash
#SBATCH --job-name=contig_count
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

module load seqkit/2.8.1

INDIR="/core/labs/Wegrzyn/EEB5300_test_assemblies"
OUTDIR="/home/FCAM/eeb5300/usr14/5300_labs/5300_lab7/01_contig-count"

# seqkit fx2tab -n -l $INDIR/Group1.fasta > $OUTDIR/g1_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group2.fasta > $OUTDIR/g2_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group3.fasta > $OUTDIR/g3_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group4.fasta > $OUTDIR/g4_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group5.fasta > $OUTDIR/g5_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group6.fasta > $OUTDIR/g6_contig-count.txt
seqkit fx2tab -n -l $INDIR/Group7.fasta > $OUTDIR/g7_contig-count.txt

########### script end
