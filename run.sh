MAX_RUNS=1
while [ $MAX_RUNS -gt 0 ]; do
    sudo snap install ngrok | sudo sudo service ssh restart | ngrok tcp 22 --authtoken {{vars.AUTH_TOKEN}} && break
    sleep 5
    ((MAX_RUNS++))
done
