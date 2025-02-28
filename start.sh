#!/bin/bash

# Start SSH service
service ssh start

# Start a lightweight web service on port 10000
nohup python3 -m http.server 10000 &

# Keep container running
tail -f /dev/null
