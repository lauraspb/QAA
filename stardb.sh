#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=02:00:00
#SBATCH --mail-user='lpaez@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir  stardb \
--genomeFastaFiles /projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/mousedna/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/mousedna/Mus_musculus.GRCm39.104.gtf