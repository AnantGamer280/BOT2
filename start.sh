#!/bin/bash

# Start SSH service
service ssh start

# Start a basic web server to keep Render happy
nohup python3 -m http.server 80 &

# Keep container running
tail -f /dev/null
