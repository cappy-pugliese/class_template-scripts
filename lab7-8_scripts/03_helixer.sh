#!/bin/bash
#SBATCH --job-name=helixer
#SBATCH -N 1
#SBATCH -n 1
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

cd /home/FCAM/eeb5300/usr14/5300_labs/5300_lab7/02_annotation/helixer

lineage=land_plant
genome=/core/labs/Wegrzyn/EEB5300_test_assemblies/Group6.fasta
prefix=euc_pauciflora_helixer
mkdir tmp1

export TMPDIR=$PWD/tmp1

module load singularity/3.9.2

singularity exec /isg/shared/databases/nfx_singularity_cache/gglyptodon-helixer-docker-helixer_v0.3.2_cuda_11.8.0-cudnn8.img fetch_helixer_models.py --lineage ${lineage}

singularity exec /isg/shared/databases/nfx_singularity_cache/gglyptodon-helixer-docker-helixer_v0.3.2_cuda_11.8.0-cudnn8.img Helixer.py --temporary-dir $TMPDIR --fasta-path ${genome} --lineage ${lineage} --gff-output-path ${prefix}.gff3

########### script end
