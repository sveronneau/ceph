data "template_file" "client-cloudinit" {
  template = "${file("./client-cloudinit.tpl")}"
}

data "template_file" "node-cloudinit" {
  template = "${file("./node-cloudinit.tpl")}"
}

data "template_file" "keystone-cloudinit" {
  template = "${file("./keystone-cloudinit.tpl")}"
}

resource "cloudca_instance" client-node {
   environment_id="${var.environment_id}"
   count="${var.client_count}"
   name="ceph-${count.index}"
   network_id="${var.network_id}"
   template="Ubuntu 16.04.02 HVM"
   compute_offering="1vCPU.4GB"
   ssh_key_name="${var.key_name}"
   user_data="${data.template_file.client-cloudinit.rendered}"
   root_volume_size_in_gb=10
}

resource "cloudca_instance" keystone-node {
   environment_id="${var.environment_id}"
   count="${var.client_count}"
   name="student-${count.index}-keystone"
   network_id="${var.network_id}"
   template="Ubuntu 16.04.02 HVM"
   compute_offering="2vCPU.4GB"
   ssh_key_name="${var.key_name}"
   user_data="${data.template_file.keystone-cloudinit.rendered}"
   root_volume_size_in_gb=20
}

resource "cloudca_instance" ceph-node {
   environment_id="${var.environment_id}"
   count="${var.node_count}"
   name="student-${count.index}-ceph-${count.index}"
   network_id="${var.network_id}"
   template="Ubuntu 16.04.02 HVM"
   compute_offering="2vCPU.8GB"
   ssh_key_name="${var.key_name}"
   user_data="${data.template_file.node-cloudinit.rendered}"
   root_volume_size_in_gb=20
}

resource "cloudca_volume" ceph_osd1 {
   environment_id="${var.environment_id}"
   count="${var.node_count}"
   disk_offering="100GB - 100 IOPS Min."
   name="${element(cloudca_instance.ceph-node.*.name, count.index)}_OSD1"
   instance_id="${element(cloudca_instance.ceph-node.*.id, count.index)}"
}

resource "cloudca_volume" ceph_osd2 {
   environment_id="${var.environment_id}"
   count="${var.node_count}"
   disk_offering="100GB - 100 IOPS Min."
   name="${element(cloudca_instance.ceph-node.*.name, count.index)}_OSD2"
   instance_id="${element(cloudca_instance.ceph-node.*.id, count.index)}"
}

resource "cloudca_volume" ceph_osd3 {
   environment_id="${var.environment_id}"
   count="${var.node_count}"
   disk_offering="100GB - 100 IOPS Min."
   name="${element(cloudca_instance.ceph-node.*.name, count.index)}_OSD3"
   instance_id="${element(cloudca_instance.ceph-node.*.id, count.index)}"
}
