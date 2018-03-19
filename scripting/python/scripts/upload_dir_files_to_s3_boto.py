import os
import boto3

client = boto3.client('s3')

for root, dirs, files in os.walk('/home/practice'):
  for file in files:
    local_path = os.path.join(root, file)
    relative_path = os.path.relpath(local_path, '/home/practice')
    s3_path = os.path.join('testdir', relative_path)

#    try:
#	client.head_object(Bucket='testbucket', Key=s3_path)
#	print "Path found on s3! Skipping %s..." % s3_path
#    except:
#	print "Uploading %s..." % s3_path
#	client.upload_file(local_path, 'testbucket', s3_path)
    print "Uploading %s..." % s3_path
    client.upload_file(local_path, 'testbucket', s3_path)
