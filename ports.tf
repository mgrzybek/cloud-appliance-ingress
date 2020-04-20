################################################################################
# Ports
#
resource "openstack_networking_port_v2" "appliance-ingress-front-port" {
  name = "appliance-ingress-front-port"
  security_group_ids = [
    var.default_secgroup_id
  ]
  network_id = var.front_net_id
}

resource "openstack_networking_port_v2" "appliance-ingress-back-port" {
  name = "appliance-ingress-front-port"
  security_group_ids = [
    var.default_secgroup_id,
    openstack_networking_secgroup_v2.appliance-ingress-secgroup.id
  ]
  network_id = var.back_net_id
}

resource "openstack_compute_interface_attach_v2" "appliance-ingress-back-port" {
  instance_id = openstack_compute_instance_v2.appliance-ingress.id
  port_id     = openstack_networking_port_v2.appliance-ingress-back-port.id
}

