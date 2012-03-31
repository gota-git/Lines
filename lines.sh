#!/usr/bin/env sh
##*********************************************##
##**  Name:lines			     **##
##**  Fuction:count all lines in the argment **##
##**  	include it's child directions        **##
##**  Author:	Gotaly			     **##
##**  Version: 0.1			     **##
##**  Last update:2012.03.31		     **##
##*********************************************##

total=0		# record total lines

lines_of_file(){
	return $(wc -l $1 | awk '{print $1}') 	# get first column return by " wc -l"
}

count(){
	local path=$2"/"$1 	# build new path
	if [ -d $path ]	
	then {
		for item in $(ls $path)	
		do
			count $item $path   # recursion to deal with dirctions 
		done
	} else {
		lines_of_file $path		
		total=$(($total+$?))
	}
	fi
}


main(){
	count $1 "." 	# current direction
	echo "The sum of all lines is:"
	echo $total
	return 0
}

main $1
