#!/bin/bash -l

for number in `seq 41 100`
do
	outfile=pw-water-"$number".out
	file=pw-water-"$number".in
	sed "s/REPLACE1/$file/g" job-base.sh > job.sh
	sed -i "s/REPLACE2/$outfile/g" job.sh
	sbatch < job.sh
done
