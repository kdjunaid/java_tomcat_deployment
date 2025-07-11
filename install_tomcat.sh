#!/bin/bash

# author: ${kdjonaid}
# vrsion: ${2.0.1}
# Date: ${28 June, 2023}

set -e

echo "📦 Installing Java (OpenJDK)..."
sudo apt update && sudo apt install default-jdk -y

echo "👤 Creating tomcat user and group..."
sudo groupadd -f tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat || true
sudo mkdir -p /opt/tomcat

echo "⬇️ Downloading Apache Tomcat..."
cd /tmp
curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz

echo "🔒 Verifying SHA512 checksum..."
curl -O https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.34/bin/apache-tomcat-10.1.34.tar.gz.sha512
sha512sum -c apache-tomcat-10.1.34.tar.gz.sha512

echo "📂 Extracting to /opt/tomcat..."
sudo tar xzvf apache-tomcat-10.1.34.tar.gz -C /opt/tomcat --strip-components=1

echo "🔧 Setting permissions..."
sudo chown -RH tomcat: /opt/tomcat
sudo chmod +x /opt/tomcat/bin/*.sh

echo "✅ Done! Tomcat is installed in /opt/tomcat"

echo "Create System Unit File"
sudo update-java-alternatives -l

echo "Copy the sevice file into tomcat system"
sudo cp tomcat.service /etc/systemd/system/

echo "Reload the system daemon"
sudo systemctl daemon-reload

echo "Start and enable tomcat"
sudo systemctl start tomcat
sudo systemctl enable tomcat

echo "Verify Apache Tomcat service is running"
sudo systemctl status tomcat

echo "Your tomcat service is running. Please visit http://<your-server-ip>:8080"
echo "Thank you"
