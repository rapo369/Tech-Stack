#Global Vars
aws_cluster_name = "Prod-SS"

#VPC Vars
aws_vpc_cidr_block = "10.140.40.0/22"
aws_cidr_subnets_private = ["10.140.41.0/26","10.140.41.64/26"]
aws_cidr_subnets_public = ["10.140.40.0/26","10.140.40.64/26"]

#Bastion Host
aws_bastion_size = "t2.micro"


#Kubernetes Cluster

aws_kube_master_num = 3
aws_kube_master_size = "m3.medium"

aws_etcd_num = 3
aws_etcd_size = "m3.medium"

aws_kube_worker_num = 3
aws_kube_worker_size = "m3.medium"

#Settings AWS ELB

aws_elb_api_port = 6443
k8s_secure_api_port = 6443
kube_insecure_apiserver_address = "0.0.0.0"

default_tags = {
#  Env = "devtest"
#  Product = "kubernetes"
}
