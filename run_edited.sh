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

coba () {
	echo "coba input nilai ini:" $1 > $1
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


#for ((i=0; i<${#scale[@]}; i++))
#do
#	coba ${scale[$i]} 
#done
#buat_file_inp $basis2 $basisset2
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#buat_file_inp $basis3 $basisset3
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#buat_file_inp $basis4 $basisset4
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#buat_file_inp $basis5 $basisset5
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#buat_file_inp $basis6 $basisset6
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#buat_file_inp $basis7 $basisset7
#/home/femto/program/orca5.0.2/orca freq.inp > freq.out
#cd ..

#for i in *.gjf;
#do
#	echo “starting $i at `date`:” >> sta;
#	g09 < $i > $i.log;
#	echo “done with status `grep termination $i.log` ” >> sta;
#	for f in *.gjf.log;
#	do
#		mv -- $f ${f%.gjf.log}.log;
#	done
#done

