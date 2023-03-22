## Autenticação no GCP (provider.tf)
variable "credentials" {
  type        = string
  description = "Chave(.json) para autenticação no GCP"
}

## Região e zona
variable "region" {
  type        = string
  description = "O nome do projeto no MongoDB Atlas"
  default = "us-east1"
}
variable "zone" {
  type        = string
  description = "Zona em que o projeto está localizado"
  default = "us-east1-b"
}

## CONTAINERD_CLUSTER (gke.tf)
variable "project_id" {
  type        = string
  description = "O nome do projeto na GCP"
  default = "lab-devops"
}
variable "cluster_name" {
  type        = string
  description = "O nome do clsuter no GKE"
  default = "lab-terraform"
}
variable "node_pool_name" {
  type        = string
  description = "O nome do node pool na GCP"
  default = "gke-gb-node-pool"
}
variable "gke_num_nodes" {
  type        = number
  description = "Quantidade de Nós"
  default = 1
}
variable "gke_min_version" {
  type        = string
  description = "Versão mínima do nós master"
  default = "1.24.9-gke.3200"
}
variable "release_channel" {
  type = string
  description = "Versão do canal"
  default = "STABLE"  
}

## CONTAINERD_CLUSTER - Maintenance Policy (gke.tf)
variable "start_time" {
  type = string
  description = "Data de início da regra"
  default = "2022-12-01T03:00:00Z"
}
variable "end_time" {
  type = string
  description = "Data de expiração da regra"
  default = "2026-08-01T09:00:00Z"
}
variable "recurrence" {
  type = string
  description = "Frequência de execução da janela de manutenção"
  default = "FREQ=WEEKLY;BYDAY=SA,SU"
}

## NODE_POOL_SEPARATED - upgrade_settings (gke.tf)
variable "strategy" {
  type        = string
  description = "Estratégia de atualização dos nós"
  default = "SURGE"
}
variable "max_surge" {
  type        = number
  description = "Quantidade máxima de nós que podem ser criados durante a atualização"
  default = 1
}
variable "max_unavailable" {
  type        = number
  description = "Quantidade máxima de nós que podem ficar indisponíveis durante a atualização"
  default = 0
}

## NODE_POOL_SEPARATED - node_config (gke.tf)
variable "machine_type" {
  type        = string
  description = "Tipo de máquina"
  default = "e2-medium"
}
variable "disk_type" {
  type        = string
  description = "Tipo de disco"
  default = "pd-standard"
}
variable "image_type" {
  type        = string
  description = "Tipo de imagem"
  default = "COS_CONTAINERD"
}

## VPC (vpc.tf)
variable "vpc_subnet_name" {
  type        = string
  description = "Nome da subnet"
  default = "homolog"
}
variable "ip_subnet_range" {
  type        = string
  description = "Range de IP da subnet"
  default = "10.2.0.0/20"
}
variable "vpc_name" {
  type        = string
  description = "Nome da rede"
  default = "homolog"
}
variable "vpc_mtu" {
  type        = number
  description = "MTU da rede"
  default = 1460
}