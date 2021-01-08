for i in `seq 1 30` 
do
	awk '/next-to-last, final/{getline; print}' $i/$i.log | tail -n 1 | awk '{print $3}'  
done
