################################################################################
# Inputs
#

variable "image_name" {
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

variable "flavor_name" {
  type        = string
  description = "Cloud flavor to use"
}

# Sending logs to a remote Graylog endpoint
variable "syslog_protocol" {
  type        = string
  description = "Protocol used to send logs: udp, tcp or http"
  default     = "udp"

  #  validation {
  #    condition     = var.syslog_protocol == "udp" || var.syslog_protocol == "tcp" || var.syslog_protocol == "http"
  #    error_message = "The log management protocol must be 'udp', 'tcp' or 'http'"
  #  }
}

variable "syslog_log_format" {
  type        = string
  description = "Log format used to send logs: gelf or syslog"
  default     = "gelf"

  #  validation {
  #    condition     = var.syslog_log_format == "gelf" || var.syslog_log_format == "syslog"
  #    error_message = "The log format must be 'gelf' or 'syslog'"
  #  }
}

variable "syslog_hostname" {
  type        = string
  description = "Hostname or address of the remote log management endpoint"
}

variable "syslog_port" {
  type        = number
  description = "Port number of the remote log management endpoint"
  default     = 12201
}


variable "logs_container" {
  type        = string
  description = "Swift container to use for cloud-init logs"
  default     = "logs"
}

##############################################################################
# InfluxDB
#

variable "influxdb_usage" {
  type        = bool
  description = "Do we send metrics to InfluxDB?"
  default     = false
}

variable "influxdb_endpoint" {
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

variable "consul_servers" {
  type        = string
  description = "Consul server IP address to join"
}

variable "consul_serf_lan_port" {
  description = "The port used to handle gossip in the LAN. Required by all agents."
  type        = number
  default     = 8301
}

##############################################################################
# Traefik 
#

variable "traefik_consul_prefix" {
  type        = string
  description = "Consul catalog prefix used to configure Traefik"
  default     = "ingress"
}

