#!/usr/bin/env sh

if [ -z $CLUSTER_NAME ]; then
    export CLUSTER_NAME="mycluster"
fi

export OPTS="-cluster $CLUSTER_NAME"

if [ -n "$YARN_QUEUE_REGEXP" ]; then
    export OPTS="$OPTS -queue $YARN_QUEUE_REGEXP"
fi

if [ -n "$NAMENODE_JMX_URL" ]; then
    export OPTS="$OPTS -nns $NAMENODE_JMX_URL"
fi

if [ -n "$JOURNALNODE_JMX_URL" ]; then
    export OPTS="$OPTS -jns $JOURNALNODE_JMX_URL"
fi

if [ -n "$RESOURCEMANAGER_JMX_URL" ]; then
    export OPTS="$OPTS -rms $RESOURCEMANAGER_JMX_URL"
fi

if [ -n "$PORT" ]; then
    export OPTS="$OPTS -port $PORT"
fi

/app/hadoop_jmx_exporter.py $OPTS
