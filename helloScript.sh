#!/bin/bash

# MULTI LINE COMMENT -> : '... ... ...'
: '

# BASIC HELLO WORLD
echo "Hello Bash Script" > file.txt
cat >> file.txt


# HEREDOC STATEMENTS
cat << kreative
this is hello creative text
added another line
kreative


# CONDITIONALS
count=10
# -eq means equal to
if [ $count -eq 10 ]
then
	echo "the condition is true"
fi

if [ $count -eq 9 ]
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# -ne means not equal to
if [ $count -ne 9 ]
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# -gt means greater than
if [ $count -gt 9 ]
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# -lt means less than
if [ $count -lt 9 ]
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# symbol > means greater than, change brackets
if (( $count > 9 ))
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# symbol < means less than
if (( $count < 9 ))
then
	echo "the condition is true"
else
	echo "the condition is false"
fi

# if elif else
if (( $count < 9 ))
then
	echo "the condition is true"
elif (( $count <= 10 ))
then
	echo "the condition 2 is true"
else
	echo "the condition is false"
fi

age=10
# AND operator && - both coditions need to be true
if [ "$age" -gt 18 ] && [ "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# other way
if [[ "$age" -gt 18 && "$age" -lt 40 ]]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# another way ... -a means and
if [ "$age" -gt 18 -a "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# OR operator -o
if [ "$age" -gt 18 -o "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# other way ... || double pipes
if [ "$age" -gt 18 ] || [ "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# another way
if [[ "$age" -gt 18 || "$age" -lt 40 ]]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

# CASE statements
car="Toyota"
case $car in
	"BMW" )
		echo "Its BMW";;
	"Mercedes" )
		echo "Its Mercedes";;
	"Honda" )
		echo "Its Honda";;
	* )
		echo "Unknown car name";;
esac


# LOOPS
number=1

# while will run till the time condition is true
while [ $number -lt 10 ]
do
	echo "$number"
	number=$(( number + 1 ))
done

# -le means less than or equal to
while [ $number -le 10 ]
do
	echo "$number"
	number=$(( number + 1 ))
done

# until loops - they run until the condition becomes true
until [ $number -ge 20 ]
do
	echo "$number"
	number=$(( number + 1 ))
done

# for loops
for i in 1 2 3 4 5
do
	echo "$i"
done

# other way - here both inclusive
for i in {0..20}
do
	echo "$i"
done

# another way - start..end..increment
for i in {0..20..2}
do
	echo "$i"
done

# another way
for (( i=0; i<5; i++ ))
do
	echo "$i"
done

# break statement
for (( i=0; i<=10; i++ ))
do
	if [ $i -gt 5 ]
	then
		break
	fi
	echo "$i"
done

# continue statement
for (( i=0; i<=10; i++ ))
do
	if [ $i -eq 3 ] || [ $i -eq 7 ]
	then
		continue
	fi
	echo "$i"
done


# SCRIPT INPUTS
echo $0 $1 $2 $3

# array input .. $@ allows unlimited input size of array
args=("$@")
echo ${args[0]} ${args[1]} ${args[2]}

# full array print
echo $@

# array length print
echo $#

# reading file using stdin
while read line
do
	echo "$line"
done < "${1:-/dev/stdin}"


# SCRIPT OUTPUTS
# standard outputs and standard errors
# 1 means a standard output is there, 1> means writing STDOUT to a file
# 2 means a standard error is there, 2> means writingg STDERR to a file
ls +al 1>file1.txt 2>file2.txt

# if no num is specified, it will automatically assume file is for STDOUT
ls -al >file1.txt

# using same file for both stdout and stderr
ls +al >file1.txt 2>&1

# shorter way of just above thing
ls -al >&file1.txt


# SEND OUTPUT FROM ONE SCRIPT TO ANOTHER SCRIPT
msg="Hello all"
export msg
./secondScript.sh


# STRINGS
echo "Enter first string:"
read st1

echo "Enter second string:"
read st2

# -eq is only for integers
# == match the actual order of string, and not length
if [ "$st1" == "$st2" ]
then
	echo "strings match"
else
	echo "strings dont match"
fi

# comparing string lengths
if [ "$st1" \< "$st2" ]
then
	echo "$st1 is smaller than $st2"
elif [ "$st1" \> "$st2" ]
then
	echo "$st2 is smaller than $st1"
else
	echo "strings are equal"
fi

# concatenation
c=$st1$st2
echo $c

# another
c=$st1" "$st2
echo $c

# first letter capital, in second case, the letter is given
echo ${st1^}
echo ${st1^l}
# to upper case complete
echo ${st1^^}


# NUMBERS AND ARITHMETIC
# doesnt add directly
echo 31 + 21

# perform this way
n1=31
n2=21
echo "Add: "$(( n1 + n2 ))
echo "Subtract: "$(( n1 - n2 ))
echo "Multiply: "$(( n1 * n2 ))
echo "Divide: "$(( n1 / n2 ))
echo "Remainder: "$(( n1 % n2 ))

# another way, expr ... for * add a backlslash
echo "eAdd: "$( expr $n1 + $n2 )
echo "eSubtract: "$( expr $n1 - $n2 )
echo "eMultiply: "$( expr $n1 \* $n2 )
echo "eDivide: "$( expr $n1 / $n2 )
echo "eRemainder: "$( expr $n1 % $n2 )

# hex to int
echo "Enter Hex no:"
read hex

# -n is to not add new line
echo -n "The decimal value of $hex is: "

# bc is a calculater in bash
# obase is for output base, ibase for input
# these are for bc to identify and calculate
echo "obase=10; ibase=16; $hex" | bc

# similarly all other conversions can also be done


# DECLARE command, to initialize variable

declare pwdfile=/etc/passwd
echo $pwdfile

pwdfile=/etc/abc.txt
echo $pwdfile

# -r is for readonly
declare -r pwdfile=/etc/passwd
echo $pwdfile

pwdfile=/etc/abc.txt
echo $pwdfile


# ARRAYS
car=("BMW" "Toyota" "Honda")

# @ is for selecting all elements
echo "${car[@]}"

echo "${car[0]}"
echo "${car[2]}"

# exclamation shows the present indexses in array
echo "${!car[@]}"

# hash is to check how many values are in the array
echo "${#car}"
echo "${#car[@]}"

# deleting value "Honda" at index 2
unset car[2]
echo "${car[@]}"

# replace values
unset car[2]
car[2]="Mercedes"
echo "${car[@]}"

# updating values
car[1]="Suzuki"
echo "${car[@]}"


# FUNCTIONS

function funcPrint()
{
	echo $1 $2 $3 $4
}

funcPrint Hi this is Kunal

function funcCheck() {
	returningValue="Using function right now"
	echo "$returningValue"
}

funcCheck

function funcCheck() {
	returningValue="I love linux"
}

returningValue="I love Mac"
echo $returningValue

funcCheck
echo $returningValue



# DIRECTORIES AND FILES

# create folder, -p to avoid error if directory already exists
mkdir -p directory2

# to check if a directory exists
echo -n "Enter directory name to check: "
read direct
# -d is to check if directory exists or not
if [ -d "$direct" ]; then
	echo "$direct exists"
else
	echo "$direct does not exists"
fi

# creating a file
echo -n "Enter file name to create: "
read fileName

touch $fileName

# checking if a file exists
echo -n "Enter file name to check: "
read fileName
# -f is to check if file exists or not
if [ -f "$fileName" ]; then
	echo "$fileName exists"
else
	echo "$fileName does not exists"
fi

# appending text into file
echo -n "Enter file name to append: "
read fileName
if [[ -f "$fileName" ]]; then
	echo -n "Enter text to append: "
	read fileText
	# double arrow to append.... single > for writing by removing all prev text
	echo "$fileText" >> $fileName
else
	echo "$fileName does not exists"
fi

# reading file line by line
echo -n "Enter file name to read: "
read fileName
if [[ -f "$fileName" ]]; then
	# IFS is for dealing with white spaces, alos we can write IFS=""
	while IFS= read -r line
	do
		echo "$line"
	done < $fileName
else
	echo "$fileName does not exists"
fi

# deleting a file
echo -n "Enter file name to delete: "
read fileName
if [[ -f "$fileName" ]]; then
	rm $fileName
	echo "$fileName has been deleted!"
else
	echo "$fileName does not exists"
fi



# CURL IN SCRIPTS

url="https://proof.ovh.net/files/1Mb.dat"

# -O to inherit original fileName
curl ${url} -O

# -o fileName to change filename
curl ${url} -o newfiledw

# another way using >
curl ${url} > outputfile

# to check if the file is right or wrong
curl -I ${url}



# PROFESSIONAL MENUS

select car in BMW MERCEDES TESLA ROVER TESLA
do
	echo "You have selected $car"
done

select car in BMW MERCEDES TESLA ROVER TOYOTA
do
	case $car in
		BMW )
			echo "BMW selected";;
		MERCEDES )
			echo "MERCEDES selected";;
		TESLA )
			echo "TESLA selected";;
		ROVER )
			echo "ROVER selected";;
		TOYOTA )
			echo "TOYOTA selected";;
		* )
			echo "ERROR: Please select between 1..5";;
	esac
done

echo "Press any key to continue..."

while [ true ]
do
	# read every 3 seconds 
	read -t 3 -n 1
	if [ $? = 0 ]; then
		echo "You have terminated the script"
		exit;
	else
		echo "Waiting for you to press the key sir!!!"
	fi
done



# WAIT FOR FILESYSTEM EVENTS WITH I-NODE NOTIFY

# inotify is to monitor directories and files
# sudo apt install inotify
mkdir -p newFolder
inotifywait -m newFolder
# now try making changes in directory, it will monitor everything



# GREP

echo -n "Enter file name to search text from: "
read fileName

if [[ -f $fileName ]]; then
	echo -n "Enter the text to search: "
	read grepvar
	# -i for ifnoring case sensitivity
	# -n for showing line no.s
	# -c for counting the no. of existence of that thing
	# -v for for sowing all lines w/o that word
	grep -i $grepvar $fileName
	grep -n $grepvar $fileName
	grep -c $grepvar $fileName
	grep -v $grepvar $fileName
else
	echo "$fileName doesnt exist!"
fi



# AWK
# awk is prog lang, its a utility
# enables programmer to write tiny effective programs
# also produces formatted outputs

echo -n "Enter file name to print from awk: "
read fileName

if [[ -f $fileName ]]; then
	awk "{print}" $fileName
	# print lines with specific word
	awk "/Linux/ {print}" $fileName
	# print 2nd field
	awk "/Linux/ {print $2}" $fileName
	# print the 3rd, 4th field
	awk "/Linux/ {print $3,$4}" $fileName
	
else
	echo "$fileName doesnt exist!"
fi
'



