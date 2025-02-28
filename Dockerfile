FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y openssh-server nano wget curl sudo python3

# Create a user with root access
RUN useradd -m -s /bin/bash admin && echo 'admin:root' | chpasswd && adduser admin sudo

# Setup SSH for remote access
RUN mkdir /var/run/sshd

# Expose ports for SSH and Web Service
EXPOSE 22 10000

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start script
CMD ["/start.sh"]
