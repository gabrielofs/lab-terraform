## Região e zona
region = "us-east1"
zone = "us-east1-b"

## Autenticação no GCP (provider.tf)
credentials = ""

## CONTAINERD_CLUSTER (gke.tf)
project_id = ""
cluster_name = "lab-terraform"
node_pool_name = "pool-terraform"
gke_num_nodes = 2
gke_min_version = "1.24.9-gke.3200"
release_channel = "STABLE"

## CONTAINERD_CLUSTER - Maintenance Policy (gke.tf)
start_time = "2022-12-01T03:00:00Z"
end_time = "2026-08-01T09:00:00Z"
recurrence = "FREQ=WEEKLY;BYDAY=SA,SU"

## NODE_POOL_SEPARATED - upgrade_settings (gke.tf)
strategy = "SURGE"
max_surge = 1
max_unavailable = 0

## NODE_POOL_SEPARATED - node_config (gke.tf)
machine_type = "e2-medium"
disk_type = "pd-standard"
image_type = "COS_CONTAINERD"

## VPC (vpc.tf)
vpc_subnet_name = "homolog"
ip_subnet_range = "10.2.0.0/20"
vpc_name = "homolog"
vpc_mtu = 1460