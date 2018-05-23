PARTITIONS=25
REPLICATION_FACTOR=2
TTL=172800000
MAX_MESSAGE_BYTES=1000012
MIN_INSYNC_REPLICAS=1
COMPRESSION_TYPE='producer'
CLEANUP_POLICY='delete'
FILE=topics.txt
if [ "$1" != "" ]
then
FILE=$1
else
echo "No topics file provided. Will assume topics.txt"
fi
if [ ! -f $FILE ]
then
  echo "ERROR: topics file not found. Exiting"
  exit -1
fi

for TOPIC_NAME in $(cat $FILE)
do
if [ $TOPIC_NAME != "" ]
then
  kubectl exec kafka-0 -- kafka-topics --create --topic "$TOPIC_NAME" --if-not-exists  --partitions "$PARTITIONS" --replication-factor "$REPLICATION_FACTOR" --config retention.ms="$TTL" --config max.message.bytes="$MAX_MESSAGE_BYTES" --config min.insync.replicas="$MIN_INSYNC_REPLICAS" --config compression.type="$COMPRESSION_TYPE"  --config cleanup.policy=$CLEANUP_POLICY --config min.cleanable.dirty.ratio=0.5 --config segment.ms=14400000 --zookeeper zk-0.zk-svc:2182
fi
done
