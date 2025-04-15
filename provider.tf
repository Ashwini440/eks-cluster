provider "aws" {
  region = var.aws_region
}
provider "kubernetes" {
  host                   = "https://${aws_eks_cluster.cluster.endpoint}"
  cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.cert_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
