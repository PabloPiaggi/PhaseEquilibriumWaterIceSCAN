for i in `seq 1 30`
do
	cd $i
	result=$(grep "!    total energy" pw-water-*.out | awk '{print $5}' | tail -n 1)
	echo $i $result
	cd ..
done
