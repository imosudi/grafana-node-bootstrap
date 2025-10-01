#!/bin/bash
install_grafana() {
  log "Installing Grafana..."
  wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
  echo "deb https://packages.grafana.com/oss/deb stable main" | \
    sudo tee /etc/apt/sources.list.d/grafana.list

  sudo apt update
  sudo apt install -y grafana

  log "Enabling Grafana service..."
  sudo systemctl daemon-reload
  sudo systemctl enable grafana-server
  sudo systemctl start grafana-server
}
