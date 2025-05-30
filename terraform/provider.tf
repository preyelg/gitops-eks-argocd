provider "aws" {
  region = "us-east-2"
}

provider "kubernetes" {
  host                   = aws_eks_cluster.gitops.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.gitops.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.gitops.token
}

data "aws_eks_cluster_auth" "gitops" {
  name = aws_eks_cluster.gitops.name
}
