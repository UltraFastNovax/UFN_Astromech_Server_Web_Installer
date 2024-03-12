#!/bin/bash

# Check OS compatibility
cat /etc/os-release

# Create installation directory
mkdir ./installer
cd ./installer

# Create downloads directory
mkdir ./downloads
cd ./downloads
curl https://download.oracle.com/java/17/archive/jdk-17.0.10_linux-x64_bin.deb --output jdk-17.0.10_linux-x64_bin.deb
curl https://raw.githubusercontent.com/UltraFastNovax/UFN_Astromech_Server_Web_Installer/main/r2_unit.service --output r2_unit.service
mkdir java
cd ./java
#download java files
cd ../../

# Install Java 17.0.10
dpkg -i ./downloads/jdk-17.0.10_linux-x64_bin.deb

# Set up service
mkdir /etc/r2_unit
cp -r ./downloads/java /etc/r2_unit
echo "java Main.java" >> /etc/r2_unit/java/start.bash
echo "pkill java" >> /etc/r2_unit/java/stop.bash
cp ./downloads/r2_unit.service /etc/systemd/system/r2_unit.service
systemctl enable /etc/systemd/system/r2_unit.service
cd ../
rm -r ./installer
echo "Finished install successfully"
