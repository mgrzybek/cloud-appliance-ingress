################################################################################
# Instances
#
resource "openstack_compute_instance_v2" "appliance-ingress" {
  name      = "ingress"
  image_id  = var.image_id
  flavor_id = var.flavor_id


  network {
    port = openstack_networking_port_v2.appliance-ingress-front-port.id
  }

  user_data = templatefile(
    "${path.module}/cloud-init.sh",
    {
      internet_http_proxy_url = var.internet_http_proxy_url,
      internet_http_no_proxy  = var.internet_http_no_proxy,
      static_hosts            = var.static_hosts,

      os_auth_url    = var.os_auth_url,
      os_username    = var.os_username,
      os_password    = var.os_password,
      os_region_name = var.os_region_name,

      metrics_endpoint_url = var.metrics_endpoint_url,
      influxdb_token       = var.influxdb_token,
      influxdb_bucket      = var.influxdb_bucket,
      influxdb_org         = var.influxdb_org,

      logs_endpoint_url = var.logs_endpoint_url,

      consul_usage      = var.consul_usage,
      consul_dns_domain = var.consul_dns_domain,
      consul_datacenter = var.consul_datacenter,
      consul_encrypt    = var.consul_encrypt,
      consul_dns_server = var.consul_dns_server,
      consul_server     = var.consul_server,

      traefik_consul_prefix = var.traefik_consul_prefix,

      ntp_server = var.ntp_server,

      git_repo_checkout = var.git_repo_checkout,
      git_repo_url      = var.git_repo_url
    }
  )
}

################################################################################
# Security groups
#
resource "openstack_networking_secgroup_v2" "appliance-ingress-secgroup" {
  name        = "appliance-ingress-secgroup"
  description = "Metrics services"
}

resource "openstack_networking_secgroup_rule_v2" "appliance-ingress-secgroup-https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.appliance-ingress-secgroup.id
}

resource "openstack_networking_secgroup_rule_v2" "appliance-ingress-secgroup-http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.appliance-ingress-secgroup.id
}

