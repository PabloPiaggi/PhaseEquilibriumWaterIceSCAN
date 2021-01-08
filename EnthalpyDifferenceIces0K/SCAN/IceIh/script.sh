for i in `seq 1 30`
do
	mkdir $i
	cd $i
	echo $i
	cp ../pw-water-$i.in .
	cp ../job.sh .
	sed -i "s/REPLACE/$i/g" job.sh
	sbatch < job.sh
	cd ..
done
