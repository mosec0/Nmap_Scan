# Nmap Scan Script

This script is a simple and user-friendly tool designed to automate basic network security scans using `bash` and `nmap`. It performs a series of scans on a specified domain or IP address and displays the results to the user. By automating these scans, the script saves time and ensures that a comprehensive set of basic scans are performed consistently and efficiently.

## Requirements

- Unix-based operating system (e.g., Linux, macOS)
- Nmap installed
- dig installed (usually part of DNS utilities package)

## Usage

1. Open a terminal window.
2. Clone the repository:
   ```
   git clone https://github.com/mosec0/Nmap_Scan.git

  ## Navigate to the script directory:

    cd Nmap_Scan

## Make the script executable:

    chmod +x scan.sh

## Run the script:

    ./scan.sh

## Script Explanation

  ## Prompt for Domain Name or IP Address:


    read -p "Enter the domain name or IP address: " domain

    Prompts the user to input a domain name or IP address.

## Resolve Domain to IP Address:

    ip_address=$(dig +short $domain)

    Uses the dig command to resolve the entered domain name to an IP address and stores the result in the ip_address variable.

## Check if the IP Address is Resolved:


    if [ -z "$ip_address" ]; then
      echo "Failed to resolve IP address for $domain"
       exit 1
    else
    echo "Resolved IP address for $domain is $ip_address"
    fi

    If the IP address is empty, displays an error message and exits the script.
    If the domain is successfully resolved, displays the resolved IP address.

## Execute Basic Nmap Scans:

  Ping Scan:

    echo "Performing ping scan..."
    nmap -sn $ip_address/24

## Top 20 Ports Scan:


    echo "Performing top 20 ports scan..."
    nmap --top-ports 20 $ip_address

## OS Detection:

    echo "Detecting OS..."
    nmap -O $ip_address

## Aggressive Scan:

    echo "Performing aggressive scan..."
    nmap -A $ip_address

## Port 80 Scan:

    echo "Scanning port 80..."
    nmap -p 80 $ip_address

## Service Version Detection:

    echo "Detecting service versions..."
    nmap -sV $ip_address

## Additional UDP Scan:


    echo "Performing UDP scan..."
    nmap -sU $ip_address

    Performs a UDP scan using nmap.

## Print Completion Message:


    echo "Scans completed."
