#!/bin/bash



src_folder="$1"


#src_folder="/home/rishu/Downloads"


find "$src_folder" -type f -print0 | while IFS= read -r -d '' f; do
    #echo "$f"
    #dirname "$f"
    #realpath --relative-to="$src_folder" "$f"
    enc_fpt="./encrypted$f"
    mkdir -p "$enc_fpt"
    
    
		# echo -ne "\r\033[K"
		  # Print new text on the same line
		#  echo -ne "$f"
    
	if [ ! -f "$enc_fpt/stat.txt" ]; then
		cur_stat=$(stat -c %y "$f")
		#echo ""
		echo "$enc_fpt"
	    acrypter encrypt cry15360 "$f" "$enc_fpt/tmp.acrypt"
	    mv "$enc_fpt/tmp.acrypt" "$enc_fpt/file.acrypt"
	    
	    echo "$cur_stat" > "$enc_fpt/stat.txt"
	    
	else
		
		cur_stat=$(stat -c %y "$f")
		last_stat=$(cat "$enc_fpt/stat.txt")
		if [[ "$cur_stat" != "$last_stat" ]]
		then
			#echo ""
			echo "$enc_fpt"
		    acrypter encrypt cry15360 "$f" "$enc_fpt/tmp.acrypt"
		    mv "$enc_fpt/tmp.acrypt" "$enc_fpt/file.acrypt"
		    
		    echo "$cur_stat" > "$enc_fpt/stat.txt"
		
		fi
	
	
	fi
	
	echo "$f" > list.txt

    
done

#echo ""

echo "encryption done $src_folder"

