output "cluster_name" {
  value = module.eks.cluster_name
}

# ❌ Commenting this out due to invalid index issue on first apply
# output "argocd_server_url" {
#   value = helm_release.argocd.status[0].load_balancer[0].ingress[0].hostname
# }

output "instructions" {
  value = "After apply, get ArgoCD URL with: kubectl get svc -n argocd argocd-server -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'"
}
