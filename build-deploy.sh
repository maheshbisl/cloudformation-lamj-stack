mvn integration-test


ls target/mahesh-webserver.war
ln -f target/mahesh-webserver.war packer/mahesh-webserver.war

# Packer build
cd packer
packer build packer.json | tee /tmp/ami-output
AMI=$(tail -5 /tmp/ami-output | grep -o 'ami-.*')
cd -

echo ${AMI}