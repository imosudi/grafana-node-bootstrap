#!/bin/bash
show_summary() {
  log "Grafana deployment complete!"
  if [ "$INSTALL_NGINX" = true ]; then
    echo "Access Grafana at: https://$DOMAIN_NAME"
  else
    echo "Access Grafana at: http://<server-ip>:3000"
  fi
  echo "Default login: admin / admin (you will be prompted to change password)."
}
