read n
sum=0

for i in $(seq 1 $n)
do
	read x
	sum=$(($sum + $x))
done

avg=$(echo "$sum / $n" | bc -l)
printf "%.3f\n" $avg
