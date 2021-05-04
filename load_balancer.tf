resource "oci_load_balancer" "lb1" {
  shape          = "100Mbps"
  compartment_id = oci_identity_compartment.tf-compartment-app.id
  subnet_ids = [oci_core_subnet.vcn-public-subnet-app.id]
  display_name = "lb1" 
}

resource "oci_load_balancer_backend_set" "lb-bes1" {
  name             = "lb-bes1"
  load_balancer_id = oci_load_balancer.lb1.id
  policy           = "ROUND_ROBIN"

  health_checker {
    port                = "8080"
    protocol            = "HTTP"
    response_body_regex = ".*"
    url_path            = "/hello-world?name=Andy"
  }
}

resource "oci_load_balancer_backend" "lb-be1" {
  load_balancer_id = oci_load_balancer.lb1.id
  backendset_name  = oci_load_balancer_backend_set.lb-bes1.name
  ip_address       = "10.0.1.100"
  port             = 8080
  backup           = false
  drain            = false
  offline          = false
  weight           = 1
}

resource "oci_load_balancer_listener" "lb-listener1" {
  load_balancer_id         = oci_load_balancer.lb1.id
  name                     = "http"
  default_backend_set_name = oci_load_balancer_backend_set.lb-bes1.name
  port                     = 80
  protocol                 = "HTTP"

  connection_configuration {
    idle_timeout_in_seconds = "2"
  }
}