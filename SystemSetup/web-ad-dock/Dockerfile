# Use the latest Ubuntu image
FROM ubuntu:latest

# Update and install git and php
# Using -y to auto-confirm installation
RUN apt-get update && apt-get install -y \
    git \
    php \
    php-cli \
    && rm -rf /var/lib/apt/lists/*

# --- AUTOMATION SECTION ---
# This is where you can add your custom scripts or commands

# Install Linux Tools
WORKDIR ~/  

RUN mkdir ./Code/

RUN git clone https://github.com/HiddenWaste/LinuxTools ./Code/LinuxTools

# Use absolute paths for reliability
WORKDIR /root
RUN mkdir -p ./Code/

# For private repos, remember the SSH Agent Forwarding we discussed!
RUN git clone https://github.com/HiddenWaste/LinuxTools ./Code/LinuxTools

# Start Apache in the background and then drop into Bash
# This keeps the container alive AND the service running
CMD service apache2 start && /bin/bash

