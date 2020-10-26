#!/bin/bash
for i in 4 8 16 32 64 128
do
   for j in 1 2 3 4 5
   do
      spark-submit --master local[128] -c spark.executor.cores=4 -c spark.executor.memory=2G -c spark.executor.memoryOverhead=348 -c spark.storage.memoryFraction=0.8 --total-executor-cores 128 --driver-memory 4G --driver-cores 1 --num-executors 10 -c spark.eventLog.enabled=true ./mllib_lr.py 1 $i 2>&1 | grep "LR.*took"
   done
   echo "========================================================="
done
