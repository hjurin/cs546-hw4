#!/bin/bash

csv_file="elapsed_times.csv"
schedule_types="static dynamic guided"
chunk_size=""

for type in $schedule_types
do
    chunk_size="1"
    export SCHEDULE_TYPE="$type"
    export CHUNK_SIZE="$chunk_size"
    echo "Computing for $type schedule for a chunk of $chunk_size (out of 30000)"
    ./bin/cg.C.x OMP_SCHEDULE="$type, $chunk_size" > /dev/null
    for chunk_size in `seq 1000 500 30000`;
    do
        export CHUNK_SIZE="$chunk_size"
        echo "Computing for $type schedule for a chunk of $chunk_size (out of 30000)"
        ./bin/cg.C.x OMP_SCHEDULE="$type, $chunk_size" > /dev/null
    done
done
