output "vpc_id"{
  description = "VPC id of eks vpc"
  value       = aws_vpc.eks_vpc.id
}

output "aws_subnets_public" {
  value = aws_subnet.eks_public_subnets.*.id

}

output "aws_subnets_private" {
  value = aws_subnet.eks_private_subnets.*.id

}

output "account_id" {
  value = data.aws_caller_identity.current.account_id

}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn 

}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id

}

output "cluster_id" {
  description = "EKS cluster ID."
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_role" {
  description = "Cluster role name"
  value       = aws_iam_role.eks_cluster_role.name

}

output "cluster_worker_role" {
  description = "cluster worker role name"
  value       = aws_iam_role.eks_worker_nodes.name

}

output "eks_fargate_profile_id" {
  value = aws_eks_fargate_profile.eks_fargate.id

}

output "aws_eks_node_group" {
  description = "Group of EC2 instances where we run our application workloads"
  value       = aws_eks_node_group.eks_node_group.*.id

}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.eks_mysql[0].arn
}

output "db_instance_class" {
  description = "The RDS instance class"
  value       = aws_db_instance.eks_mysql[0].instance_class
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.eks_mysql[0].availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.eks_mysql[0].endpoint
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.eks_mysql[0].id
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.eks_mysql[0].name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.eks_mysql[0].username
}

output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.eks_mysql[0].port
}

output "parameter_group_name"{
  description = "Db Parameter group name"
  value       = aws_db_parameter_group.eks_db_pg.name

}

output "vpc_security_group_ids"{
  description = "The vpc security group id for Treatment db"
  value       = aws_security_group.db_security_group.id

}
 
output "db_subnet_group_name"{
  description = "Db subnet group name"
  value       = aws_db_subnet_group.db_subnet_group.name

}
