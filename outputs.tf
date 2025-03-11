# Configure kubectl access
output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.eks.name}"
}
output "kubeconfig" {
  value = aws_eks_cluster.eks.kubeconfig
}
