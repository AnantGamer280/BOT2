#!/bin/bash

# Start SSH service
service ssh start

# Start TTYD (Web-based Terminal)
nohup ttyd -p 7681 bash &

# Keep container running
tail -f /dev/null
