for i in `seq 0 60` 
do
	awk '/next-to-last, final/{getline; print}' $i/$i.log | tail -n 1 | awk '{print $3}'  
done
