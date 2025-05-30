provider "aws" {
  region = "us-east-2"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.gitops.token
}

data "aws_eks_cluster_auth" "gitops" {
  name = module.eks.cluster_name
}
