for i in `seq 1 30`
do
	echo $i
	genice --rep 4 4 4 1c --format g --seed $RANDOM > 1c.gro
	vmd -dispdev none -e script-vmd.tcl
	mv 1c-full.data 1c-${i}.data
done
