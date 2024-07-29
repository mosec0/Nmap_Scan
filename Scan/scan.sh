#!/bin/bash

# Prompt for the domain name or IP address
read -p "Enter the domain name or IP address: " domain

# Resolve the domain to an IP address
ip_address=$(dig +short $domain)

# Check if the IP address is resolved
if [ -z "$ip_address" ]; then
  echo "Failed to resolve IP address for $domain"
  exit 1
else
  echo "Resolved IP address for $domain is $ip_address"
fi

# Execute nmap scans
echo "Performing ping scan..."
nmap -sn $ip_address/24

echo "Performing top 20 ports scan..."
nmap --top-ports 20 $ip_address

echo "Detecting OS..."
nmap -O $ip_address

echo "Performing aggressive scan..."
nmap -A $ip_address

echo "Scanning port 80..."
nmap -p 80 $ip_address

echo "Detecting service versions..."
nmap -sV $ip_address

# Additional scan example
echo "Performing UDP scan..."
nmap -sU $ip_address

echo "Scans completed."
