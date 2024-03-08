# 1. Replace all occurrences of a word:
sed 's/word1/word2/g' sample.txt

# 2. Delete a specific line:
sed 'Nd' sample.txt # Replace N with the line number to delete

# 3. Insert text at the beginning of each line:
sed 's/^/prefix: /' sample.txt

# 4. Append text to the end of each line:
sed 's/$/ - suffix/' sample.txt

# 5. Change a specific character to uppercase:
sed 's/^./\U&/' sample.txt

# 6. Delete leading/trailing whitespace:
sed 's/^ *//;s/ *$//' sample.txt

# 7. Extract a specific pattern with capture group:
sed 's/\(pattern\)/\1hahaha/' sample.txt

# 8. Delete everything after a delimiter:
sed 's/delimiter.*$//' sample.txt

# 9. In-place edit (use with caution!):
sed -i 's/old/new/' sample.txt

# 10. Print lines not containing a pattern:
sed '/pattern/d' sample.txt
