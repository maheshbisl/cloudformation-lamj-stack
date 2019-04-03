mvn integration-test


ls target/mahesh-webserver.war
ln -f target/mahesh-webserver.war packer/mahesh-webserver.war

cd sceptre
sceptre launch --yes vpc-alb-rds
cd -

# Packer build
cd packer
packer build packer.json | tee /tmp/ami-output
export AMI=$(tail -5 /tmp/ami-output | grep -o 'ami-.*')
cd -

echo ${AMI}