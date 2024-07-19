resource "vultr_instance" "example_instance" {
  plan = "vc2-1c-1gb"
  region = "lax"
  os_id = "387"
}