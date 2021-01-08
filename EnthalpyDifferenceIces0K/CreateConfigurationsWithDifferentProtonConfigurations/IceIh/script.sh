for i in `seq 21 30`
do
	echo $i
	genice --rep 3 3 3 1h --format g --seed $RANDOM > 1h.gro
	vmd -dispdev none -e script-vmd.tcl
	python script-ase.py
	awk '{if ($2==1) print $1,2,$3,$4,$5; else if ($2==2) print $1,1,$3,$4,$5; else print $0}' 1h.data > 1h-${i}.data	
	rm 1h.data 1h-full.data 1h.gro
done
