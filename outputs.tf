output "appliance_front_port" {
  value       = openstack_networking_port_v2.appliance-ingress-front-port
  description = "Front office port ID"
}

output "appliance_back_port" {
  value       = openstack_networking_port_v2.appliance-ingress-back-port
  description = "Back office port ID"
}

