# Java Web Server Deployment using Apache Tomcat on Ubuntu

This project contains a full step-by-step deployment of a Java application server using **Apache Tomcat** on Ubuntu Linux. It's designed to demonstrate DevOps knowledge such as service configuration, permission setup, and deployment automation via scripts.

---

## 📌 Features

- 📦 Installs Java (OpenJDK)
- ⚙️ Downloads and configures Apache Tomcat
- 🔐 Creates dedicated user and group for Tomcat
- 🚀 Configures systemd service to manage Tomcat
- 🧪 Validates checksum for download integrity
- 🌐 Opens server on `http://<your-ip>:8080`

---

## 📁 Project Structure
<pre>
  java-tomcat-deployment/
├── README.md
├── install_tomcat.sh
├── tomcat.service
└── docs/
└── java_server_deployment.pdf
</pre>

---

## 🧪 How to Run (Quick Start)

```bash
chmod +x install_tomcat.sh
sudo ./install_tomcat.sh
