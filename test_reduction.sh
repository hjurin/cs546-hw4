#!/bin/bash

csv_file="elapsed_times.csv"

for i in `seq 1 20`;
do
    echo "Computing case $i out of 20"
    ./bin/cg.C.x > /dev/null
done
