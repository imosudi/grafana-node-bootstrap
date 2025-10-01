# Grafana Node Bootstrap

🚀 Automated Bash-based deployment for a fully functional **Grafana monitoring node** on Ubuntu (20.04/22.04).  
This project bootstraps Grafana installation, service management, firewall setup, and optional **Nginx reverse proxy with Let's Encrypt SSL**.

---

## 📂 Repository Structure

```
grafana-node-bootstrap/
│
├── deploy.sh          # Main entry script (orchestration)
├── config.sh          # Configurable variables (domain, email, flags)
├── functions.sh       # Core reusable functions (logging, error handling)
├── tasks/
│   ├── update_system.sh
│   ├── install_grafana.sh
│   ├── install_nginx_ssl.sh
│   ├── configure_firewall.sh
│   └── summary.sh
└── README.md
```

---

## ✨ Features
- One-command Grafana deployment on Ubuntu.
- Automatic **system update & package installation**.
- **Grafana service setup** with systemd.
- Optional **Nginx reverse proxy** with HTTPS (Let's Encrypt).
- Configurable **firewall (UFW)** rules.
- Modular, maintainable design for easy upgrades.

---

## 🛠️ Prerequisites
- Ubuntu 20.04 or 22.04 server.
- User with `sudo` privileges.
- Domain name (if enabling Nginx + SSL).
- Internet connectivity.

---

## 🚀 Usage

Clone the repository:
```bash
git clone https://github.com/imosudi/grafana-node-bootstrap.git
cd grafana-node-bootstrap
```

Make the main script executable:
```bash
chmod +x deploy.sh
```

Edit **config.sh** to match your environment:
```bash
nano config.sh
```

Run the deployment:
```bash
./deploy.sh
```

---

## 🔧 Configuration

Modify `config.sh` to set:
```bash
DOMAIN_NAME="grafana.example.com"
EMAIL="admin@example.com"
INSTALL_NGINX=true   # or false
```

---

## 🔒 Security Notes
- Default Grafana login: `admin / admin` (you will be prompted to change password).
- Ensure you **update credentials** after deployment.
- If exposing Grafana publicly, enable HTTPS with the Nginx option.

---

## 📜 License
This project is licensed under the **BSD-3-Clause License**.  
See the [LICENSE](./LICENSE) file for details.

---

## 👨‍💻 Author
**Mosudi Isiaka**  
GitHub: [imosudi](https://github.com/imosudi)

---
