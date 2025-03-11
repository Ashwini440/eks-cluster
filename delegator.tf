provider "kubernetes" {
  host                   = aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

resource "null_resource" "install_harness_delegator" {
  depends_on = [aws_eks_cluster.eks]

  provisioner "local-exec" {
    command = <<EOT
      export KUBECONFIG="${aws_eks_cluster.example.kubeconfig}"
      kubectl apply -f https://app.harness.io/docs/delegator-install.yaml
    EOT
  }
}
