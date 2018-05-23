import boto3
from botocore.exceptions import ClientError

## print ec2 instances response

ec2 = boto3.client('ec2', region_name='ap-southeast-1')
#response = ec2.describe_instances()
response = ec2.describe_key_pairs()
print(response)
print ' '

print type(response)
print len(response['KeyPairs'])

for keyname in response['KeyPairs']:
    print keyname['KeyName']
for keyname in range(5):
    print response['KeyPairs'][keyname]['KeyName']

iam = boto3.client('iam')

# List users with the pagination interface
paginator = iam.get_paginator('list_users')
for response in paginator.paginate():
    print(response)
