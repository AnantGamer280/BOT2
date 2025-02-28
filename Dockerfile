FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt install -y openssh-server nano wget curl sudo python3 build-essential cmake git

# Install ttyd (Web-based Terminal)
RUN git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && \
    mkdir build && cd build && \
    cmake .. && make && make install && \
    cd ../.. && rm -rf ttyd

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
CMD ["/start.sh"]
