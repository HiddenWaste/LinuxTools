# Use the latest stable Alpine image
FROM alpine:latest

# 1. Install essential tools for scripting and environment setup
# We use --no-cache to keep the image slim
RUN apk add --no-cache \
    bash \
    curl \
    git \
    vim \
    jq \
    ca-certificates


# 3. [HOOK] Your custom setup commands go here
# Example: Create a test directory or download a script
# RUN mkdir -p ~/logs && touch ~/setup_test.log

RUN git clone https://github.com/HiddenWaste/LinuxTools


# 4. Set the default entry point to bash so you can interact with it
CMD ["/bin/bash"]
