#!/usr/bin/env bash

## Set server config path
if [[ -z ${KAFKA_SERVER_CONFIG} ]]; then
  KAFKA_SERVER_CONFIG="/usr/local/kafka/config/server.properties"
fi

## Server basics
if [[ -z ${KAFKA_BROKER_ID} ]]; then
  KAFKA_BROKER_ID=0
fi

## Socket server settings
if [[ -z ${KAFKA_NUM_NETWORK_THREADS} ]]; then
  KAFKA_NUM_NETWORK_THREADS=3
fi

if [[ -z ${KAFKA_NUM_IO_THREADS} ]]; then
  KAFKA_NUM_IO_THREADS=8
fi

if [[ -z ${KAFKA_SOCKET_SEND_BUFFER_BYTES} ]]; then
  KAFKA_SOCKET_SEND_BUFFER_BYTES=102400
fi

if [[ -z ${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES} ]]; then
  KAFKA_SOCKET_RECEIVE_BUFFER_BYTES=102400
fi

if [[ -z ${KAFKA_SOCKET_REQUEST_MAX_BYTES} ]]; then
  KAFKA_SOCKET_REQUEST_MAX_BYTES=104857600
fi


## Log Settings
if [[ -z ${KAFKA_LOG_DIRS} ]]; then
  KAFKA_LOG_DIRS=/tmp/kafka-logs
fi

if [[ -z ${KAFKA_NUM_PARTITIONS} ]]; then
  KAFKA_NUM_PARTITIONS=1
fi

if [[ -z ${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR} ]]; then
  KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR=1
fi

## Internal Topic Settings
if [[ -z ${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR} ]]; then
  KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1
fi

if [[ -z ${KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR} ]]; then
  KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1
fi

if [[ -z ${KAFKA_TRANSACTION_STATE_LOG_MIN_ISR} ]]; then
  KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1
fi

## Log Flush Settings
# if [[ -z ${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES} ]]; then
#   ${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES=#}
# fi

## Log retention settings
if [[ -z ${KAFKA_LOG_RETENTION_HOURS} ]]; then
  KAFKA_LOG_RETENTION_HOURS=168
fi

if [[ -z ${KAFKA_LOG_SEGMENT_BYTES} ]]; then
  KAFKA_LOG_SEGMENT_BYTES=1073741824
fi

if [[ -z ${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS} ]]; then
  KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS=300000
fi

## Zookooper
if [[ -z ${KAFKA_ZOOKEEPER_CONNECT} ]]; then
  KAFKA_ZOOKEEPER_CONNECT="localhost:2181"
fi

if [[ -z ${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS} ]]; then
  KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS=18000
fi

## Group coordinator settings
if [[ -z ${KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS} ]]; then
  KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0
fi

## Render the server config file:
cat > ${KAFKA_SERVER_CONFIG} <<EOF
## Server Basics ##
broker.id=${KAFKA_BROKER_ID}
## Socket Server Settings ##
num.network.threads=${KAFKA_NUM_NETWORK_THREADS}
num.io.threads=${KAFKA_NUM_IO_THREADS}
socket.send.buffer.bytes=${KAFKA_SOCKET_SEND_BUFFER_BYTES}
socket.receive.buffer.bytes=${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}
socket.request.max.bytes=${KAFKA_SOCKET_REQUEST_MAX_BYTES}
## Log Basics ##
log.dirs=${KAFKA_LOG_DIRS}
num.partitions=${KAFKA_NUM_PARTITIONS}
num.recovery.threads.per.data.dir=${KAFKA_NUM_RECOVERY_THREADS_PER_DATA_DIR}
## Internal Topic Settings
offsets.topic.replication.factor=${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR}
transaction.state.log.replication.factor=${KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR}
transaction.state.log.min.isr=${KAFKA_TRANSACTION_STATE_LOG_MIN_ISR}
## Log Flush Policy ##
#log.flush.interval.messages=${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES}
#log.flush.interval.ms=${KAFKA_LOG_FLUSH_INTERVAL_MS}
## Log Retention Policy ##
log.retention.hours=${KAFKA_LOG_RETENTION_HOURS}
#log.retention.bytes=${KAFKA_LOG_RETENTION_BYTES}
log.segment.bytes=${KAFKA_LOG_SEGMENT_BYTES}
log.retention.check.interval.ms=${KAFKA_LOG_RETENTION_CHECK_INTERVAL_MS}
## Zookeeper ##
zookeeper.connect=${KAFKA_ZOOKEEPER_CONNECT}
zookeeper.connection.timeout.ms=${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS}
## Group Coordinator Settings ##
group.initial.rebalance.delay.ms=${KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS}
EOF

/usr/local/kafka/bin/kafka-server-start.sh ${KAFKA_SERVER_CONFIG}