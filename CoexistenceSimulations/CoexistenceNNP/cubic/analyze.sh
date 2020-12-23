for batch in 1 2 3 4
	do
	cd Batch-${batch}
	for temp in 307.5 310 312.5
	do
		cd ${temp}K
		echo Batch-${batch} ${temp}K
		rm -r Analyze
                cp -r ../../Analyze .
		cd Analyze
                name=${batch}-${temp}
                sed -i "s/REPLACE/${name}/g" job.sh
                sbatch < job.sh
                cd ../
		cd ../
	done
        cd ../
done
