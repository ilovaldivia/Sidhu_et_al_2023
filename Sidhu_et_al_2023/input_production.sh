#!/bin/bash
#ILV, 2022: This script will create new directories for OpenSimRoot inputfiles replacing values in .xml indicated in the code.
#The replacements are taken from a spreadsheet (OSR_parameterization.csv) that contains 3 header values (0,1,2) and the rest are the replacements values (3,...,n) 
set –e
set –u
set –o pipefail

 while IFS=',' read -a line || [ -n "$line" ]
do
   echo ${line[0]}_${line[2]}
   cp -R ./Reference ./"${line[0]}"_"${line[2]}"
   sed -i s/nodoSEM/${line[3]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo1/${line[4]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo2/${line[5]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo3/${line[6]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo4/${line[7]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo5/${line[8]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/nodo6/${line[9]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/angleSEM/${line[10]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle1/${line[11]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle2/${line[12]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle3/${line[13]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle4/${line[14]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle5/${line[15]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/angle6/${line[16]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/angles.xml
   sed -i s/aerenquima/${line[17]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/aerenchyma.xml
   sed -i s/nitrogeno1/${line[18]}/g "${line[0]}"_"${line[2]}"/environments/Rocksprings/nitrate.xml
   sed -i s/densidad1/${line[20]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/maize.xml
   sed -i s/respiracion1/${line[21]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/respiration.xml
   sed -i s/optimoN/${line[22]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/nitrate.xml
   sed -i s/minimoN/${line[23]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/nitrate.xml
   sed -i s/optimoP/${line[24]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/phosphorus.xml
   sed -i s/minimoP/${line[25]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/phosphorus.xml
   sed -i s/fosforo1/${line[26]}/g "${line[0]}"_"${line[2]}"/environments/Rocksprings/phosphorus.xml
   sed -i s/diametro1/${line[27]}/g "${line[0]}"_"${line[2]}"/plantParameters/Maize/Maize/growthrates.xml
   
   
done < <(tail -n +2 OSR_parameterization.csv)


#for a in NF ROS
# do
#	for b in "PI 608619" "PI 516002" "PI 571439" "PI 571523" "PI 571629" "PI 571913" "PI 571994" "PI 471823"
#	do
#		for c in High Low
#		do
#			for d in HN LN
#			do
#				for e in rep1 rep2 rep3 rep4 rep5 
#				do
#				echo "$b"_"$a"_"$c"_"$d"_"$e"
#				cd "$b"_"$a"_"$c"_"$d"/"$e"
#				qsub -A open ../../../job.pbs
#				done
#			done
#		done
#	done
#done
