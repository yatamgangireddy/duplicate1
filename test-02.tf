resource "google_compute_instance" "duplicate_of_test_02" {
  boot_disk {
    auto_delete = true
    device_name = "test-02"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-9-stretch-v20220519"
      size  = 10
      type  = "pd-standard"
    }

   # mode   = "READ_WRITE"
   # source = "https://www.googleapis.com/compute/v1/projects/smartcoin-dev-test/zones/us-central1-a/disks/test-02"
  }

  machine_type = "n1-standard-1"

  metadata = {
    foo            = "bar"
    startup-script = "echo hi > /test.txt"
  }

  name = "duplicate-of-test-02"
project = "smartcoin-dev-test"
 network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  scratch_disk {
    interface = "SCSI"
  }

  service_account {
    email  = "terraform-usage1@smartcoin-dev-test.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  tags = ["bar", "foo"]
  zone = "us-central1-a"
}
# terraform import google_compute_instance.test_02 projects/smartcoin-dev-test/zones/us-central1-a/instances/test-02
