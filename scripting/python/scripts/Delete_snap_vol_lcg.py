import boto3

print "*** This script is for listing volumes, snapshots and LCGs which are not being used by any AMI ***"
def mainFunc(region):
        print "region is " + region

region_names = ['ap-southeast-1','ap-south-1','us-east-1','eu-west-1']
for region in region_names:
        print region
        mainFunc(region)

