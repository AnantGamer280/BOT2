FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y openssh-server nano wget curl sudo python3 unzip

# Install gotty (web-based terminal)
RUN wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.zip && \
    unzip gotty_linux_amd64.zip && \
    mv gotty /usr/local/bin/ && \
    rm gotty_linux_amd64.zip

# Create a user with root access
RUN useradd -m -s /bin/bash admin && echo 'admin:root' | chpasswd && adduser admin sudo

# Setup SSH for remote access
RUN mkdir /var/run/sshd

# Expose ports
EXPOSE 22 8080

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start script
CMD ["/start.sh"]
