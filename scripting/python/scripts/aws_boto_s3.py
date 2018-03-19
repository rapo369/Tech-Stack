import boto3
#import botocore

s3 = boto3.client('s3')
#response = s3.list_buckets()
#buckets = [bucket['Name'] for bucket in response['Buckets']]
#print ("Bucket list : %s" % buckets)

#s3 = boto3.resource('s3')
#s3.Bucket('laravel54').download_file('phone.png', 'phone.png')

s3.create_bucket(Bucket='testqdbbucket')


