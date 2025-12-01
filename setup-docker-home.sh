#!/bin/bash

# Docker HOME Version Setup
# For home network setup with username/password authentication only

echo "Setting up Docker HOME Version"
echo "=============================="

# Generate random credentials
echo "Generating random credentials..."

# Generate username with "moo-" prefix (max 22 characters total, so 18 random chars)
chars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
RIST_USERNAME="moo-"
for i in {1..18}; do
    rand=$((RANDOM % 62))
    RIST_USERNAME="${RIST_USERNAME}${chars:$rand:1}"
done

# Generate password (30 characters, alphanumeric)
PASSWORD=""
for i in {1..30}; do
    rand=$((RANDOM % 62))
    PASSWORD="${PASSWORD}${chars:$rand:1}"
done

# Display generated credentials
echo ""
echo "Generated Credentials:"
echo "======================"
echo "RIST_USERNAME: $RIST_USERNAME"
echo "PASSWORD: $PASSWORD"
echo ""

# Update .env file for HOME version
echo "Configuring .env for HOME version..."

# Create .env with HOME configuration only (username/password, no encryption)
cat > .env << EOL
NOALBS_VERSION=0.0.8
GLOBAL_SRT_VERSION=0.0.7
GLOBAL_RIST_VERSION=0.0.14

##### Home network setup #######

RIST_AUTHARGUMENTS="&username=${RIST_USERNAME}&password=${PASSWORD}"
RIST_AUTHARGUMENTS_FORWARDER=""
EOL

echo ""
echo "HOME Version Configuration Complete!"
echo "===================================="
echo "RIST Receiver Auth: username=$RIST_USERNAME, password=$PASSWORD"
echo "RIST Forwarder Auth: None (empty)"
echo "No encryption - for home network use only"
echo ""
echo "To start the services, run: docker-compose up -d"
echo "Credentials are stored in the .env file"
