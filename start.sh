#!/bin/bash

# Start SSH service
service ssh start

# Start TTYD (Web-based Terminal) in foreground
ttyd -p 7681 bash
