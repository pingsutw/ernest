#!/bin/bash
echo "5 executor 2GB 5 cores"
for i in 4 8 16 32 64 128
do
   for j in 1 2 3 4 5
   do
      spark-submit --master yarn --deploy-mode client -c spark.eventLog.enabled=true --executor-cores 5 --executor-memory 1G --num-executors 5 --driver-memory=2g ./mllib_lr.py 1 $i 2>&1 | grep "LR.*took"
   done
   echo "========================================================="
done

echo "10 executor 2GB 5 cores"
for i in 4 8 16 32 64 128
do
   for j in 1 2 3 4 5
   do
      spark-submit --master yarn --deploy-mode client -c spark.eventLog.enabled=true --executor-cores 5 --executor-memory 1G --num-executors 10 --driver-memory=2g ./mllib_lr.py 1 $i 2>&1 | grep "LR.*took"
   done
   echo "========================================================="
done

echo "5 executor 2GB 10 cores"
for i in 4 8 16 32 64 128
do
   for j in 1 2 3 4 5
   do
      spark-submit --master yarn --deploy-mode client -c spark.eventLog.enabled=true --executor-cores 10 --executor-memory 1G --num-executors 5 --driver-memory=2g ./mllib_lr.py 1 $i 2>&1 | grep "LR.*took"
   done
   echo "========================================================="
done

echo "10 executor 2GB 10 cores"
for i in 4 8 16 32 64 128
do
   for j in 1 2 3 4 5
   do
      spark-submit --master yarn --deploy-mode client -c spark.eventLog.enabled=true --executor-cores 10 --executor-memory 1G --num-executors 10 --driver-memory=2g ./mllib_lr.py 1 $i 2>&1 | grep "LR.*took"
   done
   echo "========================================================="
done

