#!/bin/bash

# Start SSH service
service ssh start

# Start Gotty (Web-based Terminal)
nohup gotty -w -p 8080 bash &

# Keep container running
tail -f /dev/null
