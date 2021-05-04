resource "oci_core_local_peering_gateway" "local_peering_gateway_1" {
    compartment_id = oci_identity_compartment.tf-compartment-bastion.id
    vcn_id = module.vcn2.vcn_id
	peer_id = oci_core_local_peering_gateway.local_peering_gateway_2.id
	#route_table_id = oci_core_route_table.test_route_table_1.id
}

resource "oci_core_local_peering_gateway" "local_peering_gateway_2" {
    compartment_id = oci_identity_compartment.tf-compartment-app.id
    vcn_id = module.vcn.vcn_id
	#peer_id = oci_core_local_peering_gateway.local_peering_gateway_1.id
	#route_table_id = oci_core_route_table.test_route_table_2.id
}



