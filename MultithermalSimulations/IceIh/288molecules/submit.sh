number=$1
mkdir 1h-${number}
cd 1h-${number}
cp ../Template/* .
sed -i "s/REPLACE/${number}/" job.sh
sed -i "s/REPLACE/${number}/" in.box
sbatch < job.sh
