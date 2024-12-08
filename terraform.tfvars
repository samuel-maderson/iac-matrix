vpc = {
        aws_region = "us-east-1"
        environment = "dev"
        cluster_name = "eks-matrix"
        vpc_name = "vpc-matrix"
        vpc_cidr_block = "10.0.0.0/16"
        #vpc_availability_zones = ["us-east-1a", "us-east-1b"]
        vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
        vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
        vpc_enable_nat_gateway = true  
}

eks = {
        aws_region = ""
        environment = ""
        cluster_name = "eks-matrix"
        cluster_service_ipv4_cidr = "10.172.0.0/16"
        cluster_version = "1.30"
        cluster_endpoint_private_access = false
        cluster_endpoint_public_access = true
        cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
        private_subnets = ["", ""]
}

eks_nodegroup = {
        aws_region = ""
        environment = ""
        cluster_name = ""
        cluster_version = ""
        private_subnets = ["", ""]
        desired_size = 2
        max_size = 3
        min_size = 2
}


eks_oidc_provider = {
        aws_region = ""
        environment = ""
        cluster_name = ""
        cluster_oidc_issuer_url = ""
        eks_oidc_root_ca_thumbprint = "f69fcb00bd04230745a986df5630a232d1a3e3c6"
}