for temp in 265 266 267.5 269 270 275
do
	meangrow=0
	counter=0
	for batch in {5..16}
	do
		if [ -f Batch-${batch}/${temp}K/log.lammps.0 ]
		then
			var=$(awk 'NF==17 {print $3}' Batch-${batch}/${temp}K/log.lammps.0 | tail -n 1)
			grow=-1
			if [ ${var%.*} -gt -7780 ]
			then
				grow=0
				meangrow=$(awk "BEGIN {print $meangrow+$grow; exit}")
				counter=$(awk "BEGIN {print $counter+1; exit}")
			fi
			if [ ${var%.*} -lt -8300 ]
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
