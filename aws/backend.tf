# S3 remote state 
terraform {
 backend "s3" {
    bucket         = "ecs-project"  
    key            = "project/eks"
    region         = "us-east-2"
    dynamodb_table = "eks_ecommerce_dynamodb"

 }
} 
