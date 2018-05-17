adminPwd=$1
if [ -z "$adminPwd" ]
then
echo "Admin pwd is mandatory arg"
exit 1
fi
qrPod=$(kubectl get pods|grep mongo-qr|head -1|awk '{print $1}')
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "db.createUser({ user: \"haa\", pwd: \"78@jkh#de7u\",roles: [{ role: \"dbOwner\", db: \"ignite\" }] });"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.enableSharding(\"ignite\");"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.alerts\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.averageDriverScore\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.config\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.curfew\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.dongleStatusAlert\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.geoFence\",{\"deviceId\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.idling\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.locations\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.notificationSetUps\",{\"userID\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.notnTokenUserMap\",{\"userID\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.speedLimit\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.vinMapper\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.trip\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.tow\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.vehiclesummary\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.gesequence\",{\"PDID\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"cluster.localiceshadow\",{\"pdid\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.servicerecords\",{\"pdId\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"cluster.localiceinfo\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.fuelLog\",{\"pdId\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.notifConfig\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.tripLocations\",{\"_id\":\"hashed\"});"
kubectl exec $qrPod -- mongo admin -u admin -p "$adminPwd" --eval "sh.shardCollection(\"ignite.accidentrecords\",{\"pdId\":\"hashed\"});"
