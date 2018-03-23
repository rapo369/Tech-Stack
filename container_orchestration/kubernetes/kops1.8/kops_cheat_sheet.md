
KOPS - version 1.8


Installation
-----------


Commands
--------

export NAME=jdkops.com
export KOPS_STATE_STORE=s3://jdkops-state-store

--> create cluster - private

	kops create cluster --master-zones --master-count --node-zones --node-count --dns private --hostedzone Route53 zone ID --networking weave ...

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









