import json
import boto3

def lambda_handler(event, context):
    client = boto3.client('ec2')
    response = client.run_instances(
        ImageId = 'ami-0fd05997b4dff7aac',
        InstanceType = 't2.micro',
        KeyName='multicloud-keypair',
        MaxCount=1,
        MinCount=1
    )