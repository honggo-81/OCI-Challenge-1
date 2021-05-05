resource "oci_identity_compartment" "tf-compartment-app" {
    compartment_id = "<Tenant_OCID>"	
    description = "Application Compartment"
    name = "Application"
}

resource "oci_identity_compartment" "tf-compartment-bastion" {
    compartment_id = "<Tenant_OCID>"	
    description = "Bastion Compartment"
    name = "Bastion"
}