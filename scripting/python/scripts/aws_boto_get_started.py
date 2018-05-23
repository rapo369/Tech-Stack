 To use Boto 3, you must first import it and tell it what service you are going to use:

import boto3

# Let's use Amazon S3
s3 = boto3.resource('s3')
Now that you have an s3 resource, you can make requests and process responses from the service. The following uses the buckets collection to print out all bucket names:

# Print out bucket names
for bucket in s3.buckets.all():
    print(bucket.name)
It's also easy to upload and download binary data. For example, the following uploads a new file to S3. It assumes that the bucket my-bucket already exists:

# Upload a new file
data = open('test.jpg', 'rb')
s3.Bucket('my-bucket').put_object(Key='test.jpg', Body=data)
Resources and Collections will be covered in more detail in the following sections, so don't worry if you do not completely understand the examples.


============  URLS   ===============



https://boto3.readthedocs.io/en/latest/guide/configuration.html#guide-configuration






#########################
















