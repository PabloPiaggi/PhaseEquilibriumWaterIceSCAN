for i in `seq 21 30`
do
	mkdir $i
	cd $i
	cp ../start.lmp .
	cp ../job.sh .
	sed -i "s/REPLACE/${i}/" start.lmp
	sed -i "s/REPLACE/${i}/" job.sh
	sbatch < job.sh
	cd ..
done
