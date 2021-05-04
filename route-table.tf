resource "oci_core_route_table" "test_route_table_1" {
    #Required
    compartment_id = oci_identity_compartment.tf-compartment-bastion.id
    vcn_id = module.vcn2.vcn_id

    route_rules {
        network_entity_id = oci_core_local_peering_gateway.local_peering_gateway_1.id
        cidr_block = "10.0.1.0/24"
    }
}

resource "oci_core_route_table" "test_route_table_2" {
    #Required
    compartment_id = oci_identity_compartment.tf-compartment-app.id
    vcn_id = module.vcn.vcn_id

    route_rules {
        network_entity_id = oci_core_local_peering_gateway.local_peering_gateway_2.id
        cidr_block = "172.16.1.0/24"
    }
}

