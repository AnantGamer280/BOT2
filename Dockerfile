FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y openssh-server nano wget curl sudo python3

# Install pre-built ttyd binary
RUN wget https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 -O /usr/local/bin/ttyd && \
    chmod +x /usr/local/bin/ttyd

# Create a user with root access
RUN useradd -m -s /bin/bash admin && echo 'admin:root' | chpasswd && adduser admin sudo

# Setup SSH for remote access
RUN mkdir /var/run/sshd

# Expose ports
EXPOSE 22 7681

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Start script
CMD ["/bin/bash", "/start.sh"]
