number=$1
mkdir 1c-${number}
cd 1c-${number}
cp ../Template/* .
sed -i "s/REPLACE/${number}/" job.sh
sed -i "s/REPLACE/${number}/" in.box
sbatch < job.sh
