sudo curl -OL https://releases.hashicorp.com/packer/1.3.5/packer_1.3.5_linux_amd64.zip && \
    sudo unzip packer_1.3.5_linux_amd64.zip -d /usr/local/bin/ && \
        sudo chmod +x /usr/local/bin/packer && \
            packer --version

sudo apt-get install -y jq python3 python3-pip

sudo pip3 install --upgrade pip
sudo pip3 install --upgrade -r requirements.txt && \
    sceptre --version && \
    aws --version && \
    jq --version