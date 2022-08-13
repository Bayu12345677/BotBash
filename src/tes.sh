



b="a -> 1. Lok
b -> 2. Gome
a -> 3. woi
b -> 4. yoi
a -> 5. tes"

total=$(echo "$b"|wc -l)
i=0
while ((i < total)); do
	let i++
	isi=$(echo "$b"|grep "a")
	echo "$isi"|tail +$i|head -1
	sleep 01
done
