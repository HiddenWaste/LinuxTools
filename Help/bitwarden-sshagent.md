
Trying to use bitwarden's sshagent is quite frustrating at first. I have
made no documentation whatsoever on it so here we begin!

1. Ensure that you have checked 'Enable SSH agent' in the bitwarden settings
2. Find where the agent's .sock is located
    2a. I download Bitwarden via snap, so mine is at: ~/snap/bitwarde/{version}/.bitwarden-ssh-agent.sock
3. Ensure that your system's ssh agent is looking towards that, this is ourlined in your .bashrc or equivalent file.
    3a. export SSH_AUTH_SOCK=/home/<user>/.bitwarden-ssh-agent.sock
