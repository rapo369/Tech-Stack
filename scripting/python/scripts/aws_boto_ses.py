import boto3

AWS_ACCESS_KEY = ''
AWS_SECRET_KEY = ''

sender = 'admin'
recipient = ''

awsregion = 'eu-west-1'

subject = "testing mail sending"

htmlbody = """<html><body> <h2> Hello </h2> </body></html>"""
textbody = "test body"
charset = "UTF-8"
client = boto3.client('ses',region_name=awsregion)
#connection = boto.ses.connect_to_region(
#            'eu-west-1',
#            aws_access_key_id=AWS_ACCESS_KEY, 
#            aws_secret_access_key=AWS_SECRET_KEY
#        )

for i in range(1000):

 print i

 try:
    response = client.send_email(
    #connection.send_email(
        Destination={
            'ToAddresses': [
                recipient,
            ],
        },
        Message={
            'Body': {
                'Html': {
                    'Charset': charset,
                    'Data': htmlbody,
                },
                'Text': {
                    'Charset': charset,
                    'Data': textbody,
                },
            },
            'Subject': {
                'Charset': charset,
                'Data': subject,
            },
        },
        Source=sender,
    )
# Display an error if something goes wrong.	
 except Exception as e:
    print "Error: ", e	
 else:
    print "Email sent!"













