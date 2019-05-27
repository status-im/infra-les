/* DERIVED --------------------------------------*/
provider "digitalocean" {
  token   = "${var.digitalocean_token}"
  version = "<= 0.1.3"
}
provider "cloudflare" {
  email  = "${var.cloudflare_email}"
  token  = "${var.cloudflare_token}"
  org_id = "${var.cloudflare_org_id}"
}

/* DATA -----------------------------------------*/

terraform {
  backend "consul" {
    address   = "https://consul.statusim.net:8400"
    lock      = true
    # WARNING This needs to be changed for every repo.
    path      = "terraform/les/"
    ca_file   = "ansible/files/consul-ca.crt"
    cert_file = "ansible/files/consul-client.crt"
    key_file  = "ansible/files/consul-client.key"
  }
}

/* LES Full Nodes ------------------------------*/

module "les-main" {
  source   = "github.com/status-im/infra-tf-digital-ocean"
  count    = 3
  env      = "main"
  group    = "main-les"
  size     = "s-2vcpu-4gb"
  vol_size = 800
  domain   = "${var.domain}"
  open_ports = [ "30303-30303" ]
}

module "les-rops" {
  source   = "github.com/status-im/infra-tf-digital-ocean"
  count    = 3
  env      = "rops"
  group    = "rops-les"
  size     = "s-2vcpu-4gb"
  vol_size = 100
  domain   = "${var.domain}"
  open_ports = [ "30303-30303" ]
}

module "les-goerli" {
  source   = "github.com/status-im/infra-tf-digital-ocean"
  count    = 3
  env      = "goerli"
  group    = "goerli-les"
  size     = "s-2vcpu-4gb"
  vol_size = 100
  domain   = "${var.domain}"
  open_ports = [ "30303-30303" ]
}
