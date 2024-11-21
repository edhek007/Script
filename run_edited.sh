#! /bin/sh

buat_file_inp () {
	cd $1
	pwd
	echo "! B3LYP FREQ" $2 "PAL4" > freq.inp	
	echo " " >> freq.inp	
	echo "%FREQ SCALFREQ" $3 "END" >> freq.inp
	echo "* XYZFILE 0 1 ../asamsitrat.xyz" >> freq.inp
	echo " "
	cat freq.inp
}

basis=("freq6-31G" "freq6-31Gbintang" "freq6-31Gbintang2" "freq6-311Gbintang" "freq6-31+Gbintang" "freq-cc-pVDZ" "freq-cc-pVTZ")
keybasis=("6-31G" "6-31G*" "6-31G**" "6-311G*" "6-31+G**" "cc-pVDZ" "cc-pVTZ")
scale=(0.9620 0.9603 0.9608 0.9663 0.9642 0.9700 0.9666)

for ((i=0; i<${#basis[@]}; i++))
do
	mkdir ${basis[$i]}
	echo "directory" ${basis[$i]} "created"
	buat_file_inp ${basis[$i]} ${keybasis[$i]} ${scale[$i]}
	/home/femto/program/orca5.0.2/orca freq.inp > freq.out
	cd ..
done
