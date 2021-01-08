for temp in 310 312.5 314 315
do
	meangrow=0
	counter=0
	for batch in {1..8}
	do
		if [ -f Batch-${batch}/${temp}K/thermo.txt ]
		then
			var=$(awk 'NF==14 {print $3}' Batch-${batch}/${temp}K/thermo.txt | tail -n 1)
			grow=-1
			if [ ${var%.*} -gt -9310 ]
			then
				grow=0
				meangrow=$(awk "BEGIN {print $meangrow+$grow; exit}")
				counter=$(awk "BEGIN {print $counter+1; exit}")
			fi
			if [ ${var%.*} -lt -9344 ]
			then
				grow=1
				meangrow=$(awk "BEGIN {print $meangrow+$grow; exit}")
				counter=$(awk "BEGIN {print $counter+1; exit}")
			fi
			#echo $temp $batch $grow
		fi
	done
	meangrow=$(awk "BEGIN {print $meangrow/$counter; exit}")
	echo $temp $meangrow $counter
done
