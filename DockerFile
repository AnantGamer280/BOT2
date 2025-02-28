FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y openssh-server nano wget curl sudo

# Create a user with root access
RUN useradd -m -s /bin/bash admin && echo 'admin:root' | chpasswd && adduser admin sudo

# Setup SSH for remote access
RUN mkdir /var/run/sshd

# Expose SSH port
EXPOSE 22

# Keep container running with a background process
CMD ["/usr/sbin/sshd", "-D"]

# Additional files for Render deployment
COPY render.yaml /app/render.yaml
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh
