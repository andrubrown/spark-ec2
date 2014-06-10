#!/usr/bin/env bash

export JAVA_HOME="{{java_home}}"

export SPARK_LOCAL_DIRS="/mnt/spark,/mnt1/spark"
export SPARK_WORKER_DIR="/mnt/spark"

# Standalone cluster options
export SPARK_MASTER_OPTS="{{spark_master_opts}}"
export SPARK_WORKER_INSTANCES={{spark_worker_instances}}
export SPARK_WORKER_CORES={{spark_worker_cores}}

export HADOOP_HOME="/root/ephemeral-hdfs"
export SPARK_MASTER_IP={{active_master}}
export MASTER=`cat /root/spark-ec2/cluster-url`

# export SPARK_LIBRARY_PATH="/root/pipelines/lib"
# export SPARK_SUBMIT_LIBRARY_PATH="/root/pipelines/lib"
export SPARK_SUBMIT_CLASSPATH=$SPARK_CLASSPATH":/root/ephemeral-hdfs/conf"

# Bind Spark's web UIs to this machine's public EC2 hostname:
export SPARK_PUBLIC_DNS=`wget -q -O - http://169.254.169.254/latest/meta-data/public-hostname`

# Set a high ulimit for large shuffles
ulimit -n 1000000
