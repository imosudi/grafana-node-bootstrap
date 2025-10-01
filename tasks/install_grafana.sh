#!/bin/bash
install_grafana() {
  log "Installing Grafana ..."

  # Import GPG key silently
  wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add - >/dev/null 2>&1

  # Add Grafana APT repository non-interactively
  echo "deb https://packages.grafana.com/oss/deb stable main" | \
    sudo tee /etc/apt/sources.list.d/grafana.list >/dev/null

  # Update & install without prompting
  sudo DEBIAN_FRONTEND=noninteractive apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y grafana

  log "Enabling Grafana service..."
  sudo systemctl daemon-reload
  sudo systemctl enable grafana-server >/dev/null
  sudo systemctl restart grafana-server
}
