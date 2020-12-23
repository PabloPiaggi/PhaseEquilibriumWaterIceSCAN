batch=$1
mkdir Batch-${batch}
for temp in 307.5
do
        cd Batch-${batch}
                mkdir ${temp}K
                cd ${temp}K
                cp ../../* .
                sed -i "s/REPLACE/${temp}/g" in.temp
                name=${batch}-${temp}
                sed -i "s/REPLACE/${name}/g" job.sh
                seed=$RANDOM
                sed -i "s/REPLACE/${seed}/g" in.seed
                sbatch < job.sh
                cd ../
        cd ../
done
