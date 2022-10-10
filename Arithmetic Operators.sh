read input
value=$(echo "$input" | bc -lq)
printf "%.3f\n" $value
