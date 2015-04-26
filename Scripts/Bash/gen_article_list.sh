#!/bin/bash
#This generates a list of article file names, which can then be piped out to create ids_aa.dat
#Or it can be uncommented to generate empty .txt files with the corresponding names of the files.


for i in {1..60}; do

printf "twp_%0.3d.txt\n" $i #| xargs touch
printf "nyt_%0.3d.txt\n" $i #| xargs touch
printf "wsj_%0.3d.txt\n" $i #| xargs touch

done
~                                                                                                                                                 
~                        
