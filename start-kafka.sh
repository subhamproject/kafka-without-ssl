#!/bin/bash

#waiting for zookpers to be up
wait-for-zk.sh "${ZK_SERVER}"

cp /broker/kafka.properties /broker/kafka${BROKER_ID}.properties

echo "broker.id=${BROKER_ID}" >> /broker/kafka${BROKER_ID}.properties
echo "listeners=PLAINTEXT://kafka${BROKER_ID}:9092" >> /broker/kafka${BROKER_ID}.properties

#Start kafka
/kafka/bin/kafka-server-start.sh  /broker/kafka${BROKER_ID}.properties

tail -f /dev/null
