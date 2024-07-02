if [ ! -s "ekor.txt" ]; then
    exit 1
fi

> tinjau.txt

while read -r no || [[ -n "$no" ]]; do
    nomer=$(echo -n "$no" | tr -d '\r\n')
    echo "$nomer" >> tinjau.txt
    for x in 1 2 3 4 5 6 7 8 9 0; do
        printf "%s%s" "$nomer" "$x" >> tinjau.txt
		echo "" >>tinjau.txt
    done
	echo "" >>tinjau.txt
done < ekor.txt

