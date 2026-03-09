# init

sudo apt update
sudo apt install unixodbc unixodbc-dev libodbc1 odbcinst1debian2 libltdl7

# Download driver 17 directly...
wget https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/m/msodbcsql17/msodbcsql17_17.10.6.1-1_amd64.deb
wget https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/m/mssql-tools/mssql-tools_17.10.1.1-1_amd64.deb

# Install drivers manually...
sudo ACCEPT_EULA=Y dpkg -i msodbcsql17_17.10.6.1-1_amd64.deb
sudo ACCEPT_EULA=Y dpkg -i mssql-tools_17.10.1.1-1_amd64.deb

sudo apt --fix-broken-install
