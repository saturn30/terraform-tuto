resource "vultr_instance" "example_instance" {
  plan = "vc2-1c-1gb"
  region = "lax"
  os_id = "387"
}

resource "vultr_block_storage" "example_blockstorage" {
  size_gb = 10
  region = "lax"
  attached_to_instance = "${vultr_instance.example_instance.id}"
}