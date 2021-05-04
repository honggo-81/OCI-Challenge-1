# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "public-security-list-app"{
	compartment_id = oci_identity_compartment.tf-compartment-app.id
	vcn_id = module.vcn.vcn_id

	# Optional
	display_name = "Security List for App"
	  
	egress_security_rules {
		stateless = false
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol = "all" 
		description = "Default Egress - Allow All Outgoing Traffic"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "172.16.1.100/32"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 22
			  max = 22
		  }
		  description = "SSH from Bastion Compute"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 80
			  max = 80
		  }
		  description = "Load Balancer HTTP Access"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 3000
			  max = 3000
		  }
		  description = "Grafana HTTP Access"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "10.0.1.0/24"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 8080
			  max = 8080
		  }
		  description = "Access to Dropwizard from Load Balancer"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "1"
		  description = "ICMP Access"
	}   
  
}	

resource "oci_core_security_list" "public-security-list-bastion"{
	compartment_id = oci_identity_compartment.tf-compartment-bastion.id
	vcn_id = module.vcn2.vcn_id

	# Optional
	display_name = "Security list for Bastion"
	  
	egress_security_rules {
		stateless = false
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		protocol = "all" 
		description = "Default Egress - Allow All Outgoing Traffic"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 22
			  max = 22
		  }
		  description = "SSH from Internet"
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "1"
		  description = "ICMP Access"
	}   
  
}	