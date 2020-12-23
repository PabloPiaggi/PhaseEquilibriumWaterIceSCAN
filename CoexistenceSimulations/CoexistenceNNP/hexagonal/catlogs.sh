for i in `ls -d */`
do
	cd $i
	for j in `ls -d */`
	do
		cd $j
			echo $i $j
			ls -v log.lammps.* | xargs cat |  awk '$1!="WARNING:" && $1!="Step" && NF==14 {print $0}' > thermo.txt
			ls -v log.lammps | xargs cat |  awk '$1!="WARNING:" && $1!="Step" && NF==14 {print $0}' >> thermo.txt
		cd ../
	done
	cd ../
done
