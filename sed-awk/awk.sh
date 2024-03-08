# 1. Print specific fields (space-separated):
awk -F' ' '{print $1, $2, $3}' sample.txt

# 2. Print lines containing a word and the next field:
awk '/word/ {print $0, $2}' sample.txt

# 3. Calculate sum/average (modify field numbers):
awk -F'::' '{ sum += $2; count++ } END {print sum/count }' sample.txt

# 4. Skip the first line:
awk 'NR > 1 {print}' sample.txt

# 5. Print lines with a specific length:
awk 'length > 35' sample.txt # Adjust length value

# 6. Count occurrences of a word:
awk '{count = gsub(/word/, "")} {printf "%s: %d, %s: %d\n", "Line", NR, "count", count}' sample.txt

# 7. Print unique lines:
awk '!a[$0]++' sample.txt

# 8. Sort lines:
awk '{print}' | sort sample.txt

# 9. Conditional printing based on a field value:
awk -F' ' '$2 == "is" {print}' sample.txt

# 10. Loop through lines and perform actions:
awk 'BEGIN { i = 0 } { i++; print i, $0 }' sample.txt
