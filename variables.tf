/* REQUIRED -------------------------------------*/

variable "cloudflare_token" {
  description = "Token for interacting with Cloudflare API."
}

variable "digitalocean_token" {
  description = "Token for interacting with DigitalOcean API."
}

variable "cloudflare_email" {
  description = "Email address of Cloudflare account."
}

variable "cloudflare_org_id" {
  description = "ID of the CloudFlare organization."
}

/* GENERAL --------------------------------------*/

variable "public_domain" {
  description = "Domain under which the public sites go."
  default     = "status.im"
}

variable "domain" {
  description = "DNS Domain to update"
  default     = "statusim.net"
}

