
#data "aws_eks_cluster_auth" "cluster" {
#   name = var.cluster_id
#}

#Get caller identity 

data "aws_caller_identity" "current" {}


#EKS Cluster 
resource "aws_eks_cluster" "eks_cluster" {
  name                      = var.cluster_name
  version                   = var.eks_version 
  role_arn                  = aws_iam_role.eks_cluster_role.arn
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  
   vpc_config {
    subnet_ids         = [ aws_subnet.eks_public_subnets[0].id  , aws_subnet.eks_public_subnets[1].id, aws_subnet.eks_private_subnets[0].id  ]
    security_group_ids =  [ aws_security_group.eks_security_group.id ]
  }
   
   tags = {
     Name    = "eks-cluster-${var.name}"
   }
}

resource "aws_cloudwatch_log_group" "eks_cluster" {
  name              = "/aws/eks/${var.name}-${var.environment}/cluster"
  retention_in_days = 30

  tags = {
    Name        = "${var.name}-${var.environment}-eks-cloudwatch-log-group"
    Environment = var.environment
  }
}

#It is actually possible to run the entire cluster fully on Fargate, but it requires some tweaking of the CoreDNS deployment
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name                = aws_eks_cluster.eks_cluster.name
  node_group_name             = var.node_grp_name
  node_role_arn               = aws_iam_role.eks_worker_nodes.arn 
  subnet_ids                  = [ aws_subnet.eks_public_subnets[0].id ] 
  instance_types              =  [var.instance_type]

  remote_access {
    ec2_ssh_key               = var.keypair
    source_security_group_ids = [ aws_security_group.eks_security_group.id ]
    
  }
  
  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 2
  }

}

#Fargate pods must include at least one private subnets
resource "aws_eks_fargate_profile" "eks_fargate" {
  cluster_name                   = aws_eks_cluster.eks_cluster.name
  fargate_profile_name           = var.fargate_prof_name
  pod_execution_role_arn         = aws_iam_role.eks_fargate_role.arn
  subnet_ids                     = [ aws_subnet.eks_private_subnets[0].id  , aws_subnet.eks_private_subnets[1].id  ]
  selector {
    namespace = "${var.fargate_namespace}"
  }

  timeouts {
    create   = "30m"
    delete   = "30m"
  }
}
