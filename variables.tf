################################################################################
# Inputs
#

variable "image_id" {
  type        = string
  description = "Operating system image to use"
}

variable "front_net_id" {
  type        = string
  description = "Network ID to use for the appliance"
}

variable "back_net_id" {
  type        = string
  description = "Backoffice network ID to use for the appliance"
}

variable "os_username" {
  type        = string
  description = "loud username for some internal batches"
}

variable "os_password" {
  type        = string
  description = "Cloud password for some internal batches"
}

variable "os_auth_url" {
  type        = string
  description = "Cloud auth URL"
}

variable "os_region_name" {
  type        = string
  description = "Cloud region name"
}

variable "git_repo_username" {
  type        = string
  description = "git username"
  default     = ""
}

variable "git_repo_password" {
  type        = string
  description = "git password"
  default     = ""
}

variable "git_repo_url" {
  type        = string
  description = "cloud-appliance-ingress repo"
  default     = "https://github.com/mgrzybek/cloud-appliance-ingress"
}

variable "git_repo_checkout" {
  type        = string
  description = "branch/tag/commit to use"
  default     = "master"
}

variable "default_secgroup_id" {
  type        = string
  description = "Default security group to use"
}

variable "internet_http_proxy_url" {
  type        = string
  description = "HTTP proxy"
  default     = ""
}

variable "internet_http_no_proxy" {
  type        = string
  description = "Proxy skiplist"
  default     = ""
}

variable "ntp_server" {
  type        = string
  description = "Remote NTP to use for sync"
  default     = ""
}

variable "static_hosts" {
  type        = string
  description = "JSON array of host:ip tuples"
  default     = ""
}

variable "flavor_id" {
  type        = string
  description = "Cloud flavor to use"
}

##############################################################################
# InfluxDB
#

variable "metrics_endpoint_url" {
  type        = string
  description = "InfluxDB endpoint to send metrics"
}

variable "influxdb_token" {
  type        = string
  description = "InfluxDB token"
}

variable "influxdb_bucket" {
  type        = string
  description = "InfluxDB bucket"
}

variable "influxdb_org" {
  type        = string
  description = "InfluxDB org"
}

variable "logs_endpoint_url" {
  type        = string
  description = "Logs endpoint to send GELF messages"
}

##############################################################################
# Consul
#

variable "consul_usage" {
  type        = bool
  description = "Do we use consul?"
  default     = false
}

variable "consul_dns_domain" {
  type        = string
  description = "DNS domain used by Consul agent"
  default     = ""
}

variable "consul_datacenter" {
  type        = string
  description = "Datacenter name used by Consul agent"
  default     = ""
}

variable "consul_encrypt" {
  type        = string
  description = "Consul shared secret for cluster communication"
}

variable "consul_dns_server" {
  type        = string
  description = "IP address to use for non-consul-managed domains"
  default     = ""
}

variable "consul_server" {
  type        = string
  description = "Consul server IP address to join"
}

##############################################################################
# Traefik 
#

variable "traefik_consul_prefix" {
  type        = string
  description = "Consul catalog prefix used to configure Traefik"
  default     = "ingress"
}

