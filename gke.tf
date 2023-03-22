# Cria um novo cluster sem um nodepool default 
resource "google_container_cluster" "containerd_cluster" {
  project  = var.project_id
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  network                  = google_compute_network.vpc_network.name
  subnetwork               = google_compute_subnetwork.vpc_subnetwork.name

  min_master_version = var.gke_min_version

  initial_node_count    = 1
  enable_shielded_nodes = true

  enable_intranode_visibility = false

  release_channel {
    channel = var.release_channel
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
    gce_persistent_disk_csi_driver_config {
      enabled = false
    }
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  maintenance_policy {
    recurring_window {
      start_time = var.start_time
      end_time   = var.end_time
      recurrence = var.recurrence
    }
  }

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  } 

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }
}

# Cria um nodepool separado
resource "google_container_node_pool" "node_pool_separated" {
  name       = var.node_pool_name
  location   = var.zone
  cluster    = google_container_cluster.containerd_cluster.name
  node_count = var.gke_num_nodes

  management {
    auto_upgrade = true
    auto_repair = true
  }

  upgrade_settings {
    strategy = var.strategy
    max_surge = var.max_surge
    max_unavailable = var.max_unavailable
  }

  node_config {
    preemptible  = false
    machine_type = var.machine_type
    disk_type  = var.disk_type
    image_type = var.image_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      "disable-legacy-endpoints" = "true"
    }
  }
}