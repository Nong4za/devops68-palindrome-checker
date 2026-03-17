provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

# 1. สร้าง Firewall (เปิดประตูให้คนเข้าเว็บได้)
resource "google_compute_firewall" "allow_web" {
  name    = "allow-web-traffic-final"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "3007", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# 2. สร้าง Server (Compute Engine)
resource "google_compute_instance" "nodejs_server" {
  name         = "nodejs-palindrome-server-v2"
  machine_type = "e2-micro"
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {} 
  }

  # Script ติดตั้ง (ไม่มี MySQL แล้ว)
  metadata_startup_script = replace(<<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y git curl
    
    # ติดตั้ง Node.js
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
    
    git clone https://github.com/Nong4za/devops68-palindrome-checker.git /opt/app
    cd /opt/app
    
    # ติดตั้ง Package และสั่งรันแอปพลิเคชัน
    npm init -y
    npm install express
    nohup node index.js > app.log 2>&1 &
  EOF
  , "\r", "")
}