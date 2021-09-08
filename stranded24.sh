#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=8
#SBATCH --time=10:00:00
#SBATCH --mail-user='lpaez@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v htseq-count --stranded=yes -r name \
sort_aligned_24_Aligned.out.sam \
/projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/mousedna/Mus_musculus.GRCm39.104.gtf \
> stranded24.txt