
KOPS - version 1.8


Installation
-----------


Commands
--------

export NAME=jdkops.com
export KOPS_STATE_STORE=s3://jdkops-state-store

--> create cluster - private

#	kops create cluster --master-zones --master-count --node-zones --node-count --dns private --hostedzone Route53 zone ID --networking weave ...
	kops create cluster \    --cloud aws \    --node-count 3\    --node-size m3.medium \    --master-size m3.medium \    --image ami-02e98f78 \    --zones us-east-1a,us-east-1b,us-east-1c \    --master-zones us-east-1a,us-east-1b,us-east-1c \    --dns-zone=Z1ITCGIAQOEZLD \    --dns private \    --topology private \    --networking weave \    --vpc=vpc-c1a355ba \    --bastion \    sskubecluster.com

  kops get cluster
  kops edit cluster
  kops update cluster
  kops update cluster --yes
  kops get ig
  kops get ig $IG_NAME
  kops edit ig $IG_NAME
  kops update cluster
  kops update cluster --yes
  kops rolling-update cluster
  kops rolling-update cluster --yes









