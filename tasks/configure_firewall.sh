#!/bin/bash
configure_firewall() {
  log "Configuring UFW firewall..."
  sudo ufw allow OpenSSH
  sudo ufw allow 3000/tcp

  if [ "$INSTALL_NGINX" = true ]; then
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
  fi

  sudo ufw --force enable
}
