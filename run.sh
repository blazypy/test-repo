
MAX_RUNS=1
while [ $MAX_RUNS -gt 0 ]; do
    # create admin user if already exists, then delete it and create a new one
    sudo userdel -rf admin 2>/dev/null || true
    sudo groupdel admin 2>/dev/null || true
    sudo useradd -m -s /bin/bash admin
    echo "admin:admin" | sudo chpasswd
    sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
    sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
    sudo systemctl restart ssh
    systemctl daemon-reload
    sudo snap install ngrok | ngrok tcp 22 --authtoken $AUTH_TOKEN && break
    sleep 5
    ((MAX_RUNS++))
done
