for i in `seq 21 30`
do
	echo $i
	genice --rep 4 4 4 1c --format g --seed $RANDOM > 1c.gro
	vmd -dispdev none -e script-vmd.tcl
	python script-ase.py
	awk '{if ($2==1) print $1,2,$3,$4,$5; else if ($2==2) print $1,1,$3,$4,$5; else print $0}' 1c.data > 1c-${i}.data	
	rm 1c.data 1c-full.data 1c.gro
done
