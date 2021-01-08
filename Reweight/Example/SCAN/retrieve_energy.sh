for i in `seq 0 100`
do
	grep "!    total energy              =" pw-water-${i}.out | awk '{print $5}'
done
