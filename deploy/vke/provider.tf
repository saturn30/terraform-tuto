terraform {
    required_providers {
        vultr = {
            source = "vultr/vultr"
            version = ">= 2.10.1"
        }    
        helm = {
            source = "hashicorp/helm"
            version = "2.14.0"
        }
    }
}

provider "vultr" {
    api_key = var.VULTR_API_KEY
}

provider "helm" {
    kubernetes {
        config_path = pathexpand("~/.kube/vke-${var.VULTR_CLUSTER_NAME}-config")
    }
}
