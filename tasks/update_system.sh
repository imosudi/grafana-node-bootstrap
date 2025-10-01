#!/bin/bash
update_system() {
  log "Updating system packages..."
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y software-properties-common curl wget gnupg ufw
}
