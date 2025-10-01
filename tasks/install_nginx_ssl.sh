#!/bin/bash
install_nginx_ssl() {
  log "Installing Nginx & Certbot..."
  sudo apt install -y nginx certbot python3-certbot-nginx

  log "Configuring Nginx reverse proxy..."
  sudo tee /etc/nginx/sites-available/grafana >/dev/null <<EOF
server {
    listen 80;
    server_name $DOMAIN_NAME;

    location / {
        proxy_pass http://localhost:3000/;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto \$scheme;
    }
}
EOF

  sudo ln -sf /etc/nginx/sites-available/grafana /etc/nginx/sites-enabled/
  sudo nginx -t || error_exit "Nginx config test failed"
  sudo systemctl reload nginx

  log "Requesting Let's Encrypt SSL..."
  sudo certbot --nginx -d "$DOMAIN_NAME" --non-interactive --agree-tos -m "$EMAIL"
}
