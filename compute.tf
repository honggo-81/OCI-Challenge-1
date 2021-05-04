resource "oci_core_instance" "ubuntu_instance_1" {

    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment-app.id
    shape = "VM.Standard.E2.1"
	
    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaam5ibvlhrhqkwhlgcxuw4dmnmppfqs36t4n6uvftfcmi3zj4tvswa"
        source_type = "image"
    }

    display_name = "app_server"
    create_vnic_details {
        assign_public_ip = false
        subnet_id = oci_core_subnet.vcn-public-subnet-app.id
		private_ip = "10.0.1.100"
		
    }
    metadata = {
        ssh_authorized_keys = file("/home/wsm/oracle/tf-compute/honggo-05-02-20-51.pub")
    } 
    preserve_boot_volume = false
	
	connection {
		type        = "ssh"
		host        = "${self.public_ip}"
		user        = "ubuntu"
		private_key = file("/home/wsm/oracle/tf-compute/honggo-05-02-20-51")
	}

	
	provisioner "remote-exec" {
		inline = [
		  "sudo apt-get update --fix-missing",
		  "sudo apt-get install -f",
		  "sudo apt-get install -y openjdk-8-jdk",
		  "sudo apt-get install -y docker.io",
		]
	}
}

resource "oci_core_instance" "ubuntu_instance_2" {

    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment-bastion.id
    shape = "VM.Standard.E2.1"
	
    source_details {
        source_id = "ocid1.image.oc1.iad.aaaaaaaam5ibvlhrhqkwhlgcxuw4dmnmppfqs36t4n6uvftfcmi3zj4tvswa"
        source_type = "image"
    }

    display_name = "bastion_server"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet-bastion.id
		private_ip = "172.16.1.100"
		
    }
    metadata = {
        ssh_authorized_keys = file("/home/wsm/oracle/tf-compute/honggo-05-02-20-51.pub")
    } 
    preserve_boot_volume = false
	
}
