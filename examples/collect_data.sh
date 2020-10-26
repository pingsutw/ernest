#!/bin/bash

function run_lr {
  mcs=$1
  scale=$2
  echo -n "Cores,$mcs,"
  #spark-submit --total-executor-cores $mcs ./mllib_lr.py $scale $mcs 2>&1 | grep "LR.*took"
  spark-submit --master yarn --executor-memory 2G  --executor-cores 1 --num-executors $mcs --driver-memory 4G --driver-cores 4 -c spark.eventLog.enabled=true ./mllib_lr.py $scale $mcs 2>&1 | grep "LR.*took"

}

run_lr 4 0.021382
run_lr 4 0.015625
run_lr 32 0.125000
run_lr 12 0.061678
run_lr 12 0.055921
run_lr 12 0.050164
run_lr 16 0.061678

#run_lr 64  0.054276
#run_lr 64  0.042763
#run_lr 64  0.031250
#run_lr 128 0.031250

#run_lr 12  0.061678
#run_lr 16  0.061678
