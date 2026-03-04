#!/usr/bin/env bash
set -euo pipefail

echo "===== Setting up Nginx ====="

# Check if nginx is installed
if command -v nginx &> /dev/null; then
    echo "Nginx already installed: $(nginx -v 2>&1)"
else
    echo "Installing nginx..."
    sudo apt update
    sudo apt install -y nginx
    echo "Nginx installed."
fi

# Enable nginx to start on boot
echo "Enabling nginx service..."
sudo systemctl enable nginx

# Start nginx if not running
echo "Starting nginx..."
sudo systemctl start nginx

# Test nginx config
echo "Testing nginx configuration..."
sudo nginx -t

echo "Reloading nginx..."
sudo systemctl reload nginx

echo "===== Nginx setup complete ====="

echo "You can verify by visiting:"
echo "http://$(curl -s ifconfig.me)"
