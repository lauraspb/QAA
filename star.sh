#!/usr/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --cpus-per-task=16
#SBATCH --time=02:00:00
#SBATCH --mail-user='lpaez@uoregon.edu'
#SBATCH --mail-type=END,FAIL

/usr/bin/time -v STAR --runThreadN 16 \
--runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 \
--alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/trimoutput_1_1P.fq.gz /projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/trimoutput_1_2P.fq.gz \
--genomeDir /projects/bgmp/lpaez/bioinformatics/Bi623/AQAA/stardb \
--outFileNamePrefix aligned_1_