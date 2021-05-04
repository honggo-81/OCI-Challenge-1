# Source from https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/

module "vcn"{
  source  = "oracle-terraform-modules/vcn/oci"
  version = "2.2.0"
  compartment_id = oci_identity_compartment.tf-compartment-app.id
  
  region = "us-ashburn-1"
  vcn_name = "Application VCN"
  vcn_dns_label = "app"

  internet_gateway_enabled = true
  nat_gateway_enabled = false
  service_gateway_enabled = true
  vcn_cidr = "10.0.0.0/16"

 internet_gateway_route_rules = [
 {
	destination       = "172.16.1.0/24"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.local_peering_gateway_2.id
    description       = "Route to Bastion network"
 }]

}

module "vcn2"{
  source  = "oracle-terraform-modules/vcn/oci"
  version = "2.2.0"
  compartment_id = oci_identity_compartment.tf-compartment-bastion.id
  
  region = "us-ashburn-1"
  vcn_name = "Bastion VCN"
  vcn_dns_label = "bastion"

  internet_gateway_enabled = true
  nat_gateway_enabled = false
  service_gateway_enabled = true
  vcn_cidr = "172.16.0.0/16" 
  
 internet_gateway_route_rules = [
 {
	destination       = "10.0.1.0/24"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_local_peering_gateway.local_peering_gateway_1.id
    description       = "Route to App network"
 }]
  
}
