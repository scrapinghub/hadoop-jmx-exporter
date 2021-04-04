#!/usr/bin/env sh

if [ -z $CLUSTER_NAME ]; then
    export CLUSTER_NAME="mycluster"
fi

export OPTS="-cluster $CLUSTER_NAME"

if [ ! -z $YARN_QUEUE_REGEXP ]; then
    export OPTS="$OPTS -queue $YARN_QUEUE_REGEXP"
fi

if [ ! -z $NAMENODE_JMX_URL ]; then
    export OPTS="$OPTS -nns $NAMENODE_JMX_URL"
fi

if [ ! -z $JOURNALNODE_JMX_URL ]; then
    export OPTS="$OPTS -jns $JOURNALNODE_JMX_URL"
fi

if [ ! -z $RESOURCEMANAGER_JMX_URL ]; then
    export OPTS="$OPTS -rms $RESOURCEMANAGER_JMX_URL"
fi

if [ ! -z $PORT ]; then
    export OPTS="$OPTS -port $PORT"
fi

/app/hadoop_jmx_exporter.py $OPTS