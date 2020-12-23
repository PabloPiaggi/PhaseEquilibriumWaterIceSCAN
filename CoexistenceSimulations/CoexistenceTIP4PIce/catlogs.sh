for i in `ls -d */`
do
	cd $i
	for j in `ls -d */`
	do
		cd $j
			echo $i $j
			awk '$1!="Step" && NF==17 {print $0}' log.lammps.0 > thermo.txt
			#ls -v log.lammps | xargs cat |  awk '$1!="Step" && NF==17 {print $0}' >> thermo.txt
		cd ../
	done
	cd ../
done
