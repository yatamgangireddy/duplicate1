resource "google_compute_instance" "test_01" {
  boot_disk {
    auto_delete = true
    device_name = "test-01"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/centos-cloud/global/images/centos-7-v20220303"
      size  = 20
      type  = "pd-standard"
    }

    mode   = "READ_WRITE"
    source = "https://www.googleapis.com/compute/v1/projects/smartcoin-dev-test/zones/asia-south1-a/disks/test-01-1"
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  machine_type = "n1-standard-1"

  metadata = {
    ssh-keys = "sc-167-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcymIcTvzjy7cB4Bo2D39FhaoaheCf56WfAcruPPlultlfPgr4R6HeajLYL6NC88r81/97z4u2kP103IdVzbR0Xy897yYOsQwbVkzcC3L0vxxf1yPGEzjGnFGPzKfUewd8Pj5ZCsJx7b+mfa5cpaVYu0r3Hwm8BUAepC9nCyNJZEMy3NC9qoAofHuWSPjXcRJuUpff7zKxo1yvLX0CA3zGCbJ8qw0oRf9kjgFjcvKSSv/hD62izuJNXY72y/Ug6DI4cxBuw1emywDUypSem4OwIoym/FHszLmZE/MeMcn+X9/JioP6u/iMMV6Q4PjcEoJop3tv7ej9kK4bYAJ5E9b8pTn4u9H/gSZQC1luCsM+v1x9wgFJKIRiGpbAH9s6AqZfJ1+PKFySmds8+pJjNu6oHDIqNSQwA4TMD9w+PWl1ccX5TZkSmZLTmmiLltzFslH6sKy6zRH869Dox4cMFYXF8Y7zqcYhcyyXNW243HFrik7nOud+2HcJnnH66IpkPJk= sc-167-user@sc167user-ThinkPad-T490\nroot:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhTumFz9mI+gZTH0VXubSTHb0+dBvfD0HQ/V8GGc+WXipvNEwEfY7n6MdgfWSf6zysyijOniQR/zE8/z2gMC6H0XfTOri4BhZOmpV7CsiaV+C3fB7G8v2RybgmuvMzlsqVLWRW3jNI8UA9BrTzGmarwN3lDKJTChxIZCuni/2woxJ5npgswdLb2+PPlX7rvHWdWQrZUrX2uWZBdRAZnBBydAvXFYRcNwyCdoyt38OF7dzO6IcGkPBimZXX9Lij1c3Egz1uCIDLBnzCfIbDuTCgIBj7S6eiF0cfIUIBFxaiZWdSInFnj1SKr+Dt7N8aoSqZ3UBo1hrb75MnOp15cofHx/VNG4qMdXN25xj1DbpN3LCDVnXJYbe0AIFdaCtHinjtLNhm37TdshsZwrkEQukWdURLebLdmnciBq6jKSffAFJoIHFIYKAZXooDd2iaGJfbZQuPywNHMWNq96wWAljEkBclGbkPejQtMtVboffbbEJV2dJD1p8MT8ugZ5MD238= root@sc349-ThinkPad-T14-Gen-2i\nsc-193-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyfMLxtFMTbuhqaM61to7fqCYFH+xwC/zAp+8kESzFglc37ZkV0qGE8l0+xucZNxLrgAGRnVcDUK5K3/tl+ti4XhgJLRWsulQTsdzuIqetTFSLZMQw0KLM5qIUPhJBBCQ8rh1yzvcmCalKw+rbfQgxP/8DAbKibbCoDAmvICQjDI2QfF8/lzO99nG+Qp/SWRX8j5nlpRg0aXonHe+ZFQ6Oaeo6NHa90h8iEq2JYBcPYUvu4SXsb5BK9daebMWiI8hp4zxmj/O+JGLQz7jtuvnYz+COhGpLhpZuBEED+hTlubuzCgorPkoG47uHxVHErPXrYE+DhfMzA6nCr1NpcH7ceNr8Ya8Gcfjr1nQtFioamOwPD7agGfS1faDlUSGz6UW0x51JzcpPMLv22oieZIfc3vPwm/4rpfVCmCJYf03MK3qV6ReBRRfmPSmSYFx9cl0+KG31qVXaPeNnwaL67jWWUjYSVLt7aaRmbF+Pt0vd8QwrEcPrC0NVRRTOPBsUVIE= sc-193-user@sc193user-ThinkPad-T14-Gen-1\nmayanksingh:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGQpkmme9Ei9MQFfK1suGs41lU6DiDWP3SXvUtplUTPDEJjp4efmZJ/NlnmDIXjziNuQa4zPT7BMTDn7B9FpmYMeoU3BTbHA90xMNiMvHxDxjbtzq8VJQiiOVpL8c3fus9NDGHcX3ZNZ2DQl6KllPZ0q5asfRecqpN9dsQr9jJFDJeRRZ+4H0wkLQuc38oB9UEa1I6U2DXXr3oFaewCrYg1jiOxhEtoTraZpuNsZwN4GwDOThX30axEiHhXgELMhSdY5priqBzwGn3p4DKZiYm5CLMm39r9L0rgrSLCxsP7ke+PNn4Es7hMS49yg+aOtqfuu7hvVzs6NGiKpTzmGjMf/xPm2lE9vj0Gl5siIeUms9vbOkmIF25Q7pJMKne4eCkZ4kwj2MAiamfDnFsV6+EY7pI+ToakOyqqW4spNddAB2YVRIW8atzFIN2h78sepur8mSbHY7imGb7uTTs3umzTErQUlGY8rYN4DjD8+b0rIlyd9mRApW245r8VfX2j08= mayanksingh@Mayanks-MacBook-Air.local\nyatam.reddy:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBCQ8gflwduEA57Jhg5EelF/jkOeL9N7JUC3CGYzET+G7fzfqpd2S8vnLCCIsUzW0KkhiXeNMigjHokp80pvFsvc= google-ssh {\"userName\":\"yatam.reddy@smartcoin.co.in\",\"expireOn\":\"2022-04-05T11:36:50+0000\"}\nroot:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpH+AkxG/ygKjOP7JJGUTOFFzbtoyejdJavq2oe2Qj8Lu88WfLY4CUsabQRmmLLWb9bRpPBc9vXJH+vtPOzBTkb5top0eXWRQMhhpSYq8dMfaYem7CJPCZDCeb5cBW8mZ1DiwIW5oYX3WbGmDGx1bZsCyIsj4XDj7NHAe60CAAgP4zFsm8IEm/MPvMyuhV+2yvrP1fJyV/OTk2w05h5M8dxxiJb6S/L125alwyb0z+f8RSXFjJ20U8oNsq8v673u44H+0AjXWI/dwwYYVkDxUjynl/FP6buCIU757xU6xczCP5+rEPZl/NtoIZIHYpiMBPuE0iiF+hiyy6GPC94ROD044Gnm6e4y1MNOH9fGfqXNA9REvzXRT3pcXVeYwYhIgjBU9dSBzSgNLQhszenXA9O29LQ4v7CPgTFPYoAP2h9jwqFPA3feY271RQw/IKdWm4pKf1rhDOFawpwtYA1fCCXKky7FCw0tp4UjyoAFDAXa4Xs0uLuWZzTt81DbM3B5U= root@Mayanks-MacBook-Air.local\nsc-349-user:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFrMULrY0jFpFUjQ909OoOUwsxh9rhPd0ASQTyuPeq7IgmJSm4QJ6PASqwARO/x0tmvPzZPWBObL4uXh2+PzzwbbY2G0nf35DpNPGpKQ8e/hkFfKkT0rqYEtfyvfhMrjKjjeV2ONfi+/60on3YRo03YIwtYK00EzU8zPExflGkDcBMQI9EIhavp8/mTMu1IFZLU0ad/OoQE9hJ39OqGUCrw55/q0vSaACDmC+BBgtLBjkDkNSBEb/XU0XKxBvkXYDhvLEIqUirzuOHqe32NVDwBrFclwMgIkIyXgeYcvgtLq2y+7RX+w472fPiq4y4+eIVb7rcuBeDsWg5z9pJsE9LPDxoQCLCb21GrbpgxbqPx0HF9yOW26OpkLaGYjPFwpUXII5QGXNFdcNdxzRUK55m2tVFuDKvD36WvIu3PnddvdrEnZBTrnJQABajzQFVFYD8R4Z1vgp27u2pQhLpLV9Rp8gV8cuyVnyzhWg83rmK6v8NA2/Ikaetv/20aq1j208= sc-349-user@sc349-ThinkPad-T14-Gen-2i"
  }

  name = "test-01"

  network_interface {
    access_config {
      nat_ip       = "34.100.167.221"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/smartcoin-dev-test/global/networks/default"
    network_ip         = "10.160.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/smartcoin-dev-test/regions/asia-south1/subnetworks/default"
    subnetwork_project = "smartcoin-dev-test"
  }

  project = "smartcoin-dev-test"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "845069186089-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  zone = "asia-south1-a"
}
# terraform import google_compute_instance.test_01 projects/smartcoin-dev-test/zones/asia-south1-a/instances/test-01
