# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-public-subnet-app"{
  compartment_id = oci_identity_compartment.tf-compartment-app.id
  vcn_id = module.vcn.vcn_id
  cidr_block = "10.0.1.0/24"
 
  # Optional
  route_table_id = module.vcn.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list-app.id]
  display_name = "public-subnet-app"
}

resource "oci_core_subnet" "vcn-public-subnet-bastion"{
  compartment_id = oci_identity_compartment.tf-compartment-bastion.id
  vcn_id = module.vcn2.vcn_id
  cidr_block = "172.16.1.0/24"
 
  # Optional
  route_table_id = module.vcn2.ig_route_id
  security_list_ids = [oci_core_security_list.public-security-list-bastion.id]
  display_name = "public-subnet-bastion"
}