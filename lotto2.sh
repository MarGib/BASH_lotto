#!/bin/bash

echo "Podaj 6 Twoich liczb :"
read $1 $2 $3 $4 $5 $6;
echo "";
echo " Twoje liczby to : "$1 $2 $3 $4 $5 $6;
echo "";
echo "Podaj ilosc losowań ? ";
read il;

# ----- Losowanie LOTTO 6 z 49 ----- 
for i in $(eval echo "{1..$il}")
do
	losowanie=`shuf -i 1-49 -n6 | xargs -n6`;
		echo"";
		echo "------------------------------------------";
		echo "LOSOWANIE NR: " $i "  Twoje liczby to : "$1 $2 $3 $4 $5 $6;
		echo "Wylosowano : "$losowanie;
                
		l1=`echo $losowanie | cut -d " " -f 1`;
		l2=`echo $losowanie | cut -d " " -f 2`;
		l3=`echo $losowanie | cut -d " " -f 3`;
		l4=`echo $losowanie | cut -d " " -f 4`;
		l5=`echo $losowanie | cut -d " " -f 5`;
		l6=`echo $losowanie | cut -d " " -f 6`;
		
		# echo $l1 $l2 $l3 $l4 $l5 $l6;
		
		for i in {1..6}; do
			
			for n in $1 $2 $3 $4 $5 $6; do
  				if [[ $n = $[l$i] ]]; then
    				echo " Trafiono :" $n;
				((s++));
				fi
			done
				
		done
		echo "";
		if [[ $s > 0 ]]; then 
			echo " ILE TRAFIONO ? : "$s;
		fi	
		echo "------------------------------------------";

		
		if [[ $s = 1 ]]; then 
			((ile_1++)); 
		fi

		if [[ $s = 2 ]]; then
                        ((ile_2++));
                fi

        	if [[ $s = 3 ]]; then
                        ((ile_3++));
                fi

		if [[ $s = 4 ]]; then
                        ((ile_4++));
                fi

		if [[ $s = 5 ]]; then
                        ((ile_5++));
                fi

		if [[ $s = 6 ]]; then
                        ((ile_6++));
                fi





		# Wyczyszczenie zmiennej zliczającej ilość trafionych liczb "s"
		s="";
		
done
echo"";
echo"";
echo "  ###### STATYSTYKI #####  " ;
echo"";
echo "Z $il losowań trafiono : " $ile_1 "pojedynczych trafień. ";
echo "Z $il losowań trafiono : " $ile_2 "podwojnych trafień. ";
echo "Z $il losowań trafiono : " $ile_3 "trojek. ";
echo "Z $il losowań trafiono : " $ile_4 "czworek. ";
echo "Z $il losowań trafiono : " $ile_5 "piątek . ";
echo "Z $il losowań trafiono : " $ile_6 "szostek . ";



