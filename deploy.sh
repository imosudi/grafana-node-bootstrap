#!/bin/bash
# =========================================================
# Grafana Node Bootstrap - Deployment Orchestrator
# =========================================================

# Load configs and functions
source ./config.sh
source ./functions.sh

# Load tasks
source ./tasks/update_system.sh
source ./tasks/install_grafana.sh
source ./tasks/install_nginx_ssl.sh
source ./tasks/configure_firewall.sh
source ./tasks/summary.sh

# -------------------------------
# MAIN EXECUTION FLOW
# -------------------------------
main() {
  update_system
  install_grafana

  if [ "$INSTALL_NGINX" = true ]; then
    install_nginx_ssl
  fi

  configure_firewall
  show_summary
}

main "$@"
