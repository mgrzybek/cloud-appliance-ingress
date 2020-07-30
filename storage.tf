################################################################################
# Volumes
#
resource "openstack_blockstorage_volume_v2" "appliance-ingress-containers" {
  name = "containers"
  size = 5
}

resource "openstack_compute_volume_attach_v2" "appliance-ingress-containers" {
  instance_id = openstack_compute_instance_v2.appliance-ingress.id
  volume_id   = openstack_blockstorage_volume_v2.appliance-ingress-containers.id
}

