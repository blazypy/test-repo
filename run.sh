
MAX_RUNS=1
while [ $MAX_RUNS -gt 0 ]; do
    # create admin user
    sudo useradd -m -s /bin/bash admin
    echo "hunter87:hunter87" | sudo chpasswd
    sudo usermod -aG sudo hunter87
    sudo snap install ngrok | sudo sudo service ssh restart | systemctl daemon-reload | ngrok tcp 22 --authtoken $AUTH_TOKEN && break
    sleep 5
    ((MAX_RUNS++))
done
