#!/bin/bash

function run_lr {
  mcs=$1
  scale=$2
  echo -n "Cores,$mcs,"
  #spark-submit --total-executor-cores $mcs ./mllib_lr.py $scale $mcs 2>&1 | grep "LR.*took"
  spark-submit --master local[*] -c spark.executor.cores=4 -c spark.executor.memory=2G -c spark.executor.memoryOverhead=348 -c spark.storage.memoryFraction=0.8 --total-executor-cores 128 --driver-memory 4G --driver-cores 4 --num-executors 10 -c spark.eventLog.enabled=true ./mllib_lr.py $scale $mcs 2>&1 | grep "LR.*took"

}

run_lr 42 0.163240
run_lr 2 0.007812
run_lr 126 0.500000
run_lr 128 0.500000
run_lr 34 0.137336
run_lr 124 0.500000
run_lr 8 0.033717
run_lr 48 0.189145

#run_lr 64  0.054276
#run_lr 64  0.042763
#run_lr 64  0.031250
#run_lr 128 0.031250

#run_lr 12  0.061678
#run_lr 16  0.061678
