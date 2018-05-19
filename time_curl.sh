#!/bin/bash
#time_curl.sh

##CONFIG
url=('http://google.be' 'http://telenet.be' 'http://sporza.be')
inputfile='~/@curl-format.txt'
file=${input:-$file}
run=1
proxy='-x http://192.168.250.1:3128'

	printf "[ 1 ] testing with no proxy \n"
	printf "[ 2 ] testing with proxy \n"
	printf "> "
  	read source_choice

	printf "Name your file! \n"
	read -p "Enter: " file

while [ $run -eq 1 ]
do
        echo "Sending curl request"

    for i in "${url[@]}"
    do
        echo $i >> $file
        
	if [ $source_choice -eq 1 ]
	then
		curl -w $inputfile -o /dev/null -s "$i" >> $file
    	
	elif [ $source_choice -eq 2 ]
        then
		curl -w $inputfile -o /dev/null -s "$i" $proxy >> $file
	fi
        sleep 1
	done
done

