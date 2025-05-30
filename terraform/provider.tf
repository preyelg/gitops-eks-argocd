provider "aws" {
  region = var.region
}

# Trick to delay evaluation of kubernetes provider until EKS is ready
data "aws_eks_cluster" "gitops" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "gitops" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.gitops.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.gitops.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.gitops.token

}
