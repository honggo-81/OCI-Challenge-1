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
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "6"
		  tcp_options { 
			  min = 8080
			  max = 8080
		  }
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "1"
 
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
	}

	ingress_security_rules { 
		  stateless = false
		  source = "0.0.0.0/0"
		  source_type = "CIDR_BLOCK"
		  protocol = "1"

	}   
  
}	