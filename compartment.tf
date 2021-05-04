resource "oci_identity_compartment" "tf-compartment-app" {
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaopwqdoedjr72up3pg7okzlezsf45yw3nf4j2f5m23kojb5z5j3zq"	
    description = "Application Compartment"
    name = "Application"
}

resource "oci_identity_compartment" "tf-compartment-bastion" {
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaopwqdoedjr72up3pg7okzlezsf45yw3nf4j2f5m23kojb5z5j3zq"
    description = "Bastion Compartment"
    name = "Bastion"
}