# ----------> Compartment <----------

variable "compartment_name" {
  type    = string
  default = "oke-free"
}

variable "region" {
  type    = string
  default = "sa-saopaulo-1"
}

variable "availability_domain" {
  type    = number
  default = 0
}

# ---------->VM's----------

variable "shape" {
  type    = string
  default = "VM.Standard.A1.Flex"
}

variable "ocpus_per_node" {
  type    = number
  default = 2
}

variable "memory_in_gbs_per_node" {
  type    = number
  default = 12
}

variable "image_id" {
  type    = string
  default = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaauym5h76ykduai2ltoldkhrmeuubmb4nrmxyg4kivmcouiesgjk5a"
}
# Link to a list of available images (We are using Oracle-Linux-8.9-aarch64-2024.04.19-0-OKE-1.29.1-693, allways use the ARM version): https://docs.cloud.oracle.com/iaas/images/

# ----------> Cluster <----------
variable "k8s_version" {
  type    = string
  default = "v1.29.1"
}

variable "node_size" {
  type    = string
  default = "2"
}

variable "cluster_name" {
  type    = string
  default = "k8s-cluster"
}

# ----------> Network <----------

variable "vcn_name" {
  type    = string
  default = "k8s-vcn"  
}

variable "vcn_dns_label" {
  type    = string
  default = "k8svcn"  
}

# ----------> Load Balancer <----------

variable "load_balancer_name_space" {
  type    = string
  default = "loadbalancer"
}

variable "node_port_http" {
  type    = number
  default = 30080
}

variable "node_port_https" {
  type    = number
  default = 30443
}

variable "listener_port_http" {
  type    = number
  default = 80
}

variable "listener_port_https" {
  type    = number
  default = 443
}

# ----------> Authentication <----------

variable "ssh_public_key" {
  type    = string
}

variable "fingerprint" {
  type    = string
}

variable "private_key_path" {
  type    = string
}

variable "tenancy_ocid" {
  type    = string
}

variable "user_ocid" {
  type    = string
}