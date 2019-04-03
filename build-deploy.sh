mvn integration-test


ls target/mahesh-webserver.war
ln -f target/mahesh-webserver.war packer/mahesh-webserver.war

cd sceptre
sceptre launch --yes vpc-alb-rds
cd -

#pass DNS of DB and loadbalancer to packer
function get_export()
{
    echo `aws cloudformation list-exports | jq -r '.Exports[] | select(.Name=="'${1}'") | .Value'`
}
DB_DNS=$(get_export maheshdbInternalDNS)
LB_DNS=$(get_export ALBDNSName)

cat << EOF > packer/environment.txt
DB_DNS=${DB_DNS}
LB_DNS=${LB_DNS}
EOF

# Packer build
cd packer
packer build packer.json | tee /tmp/ami-output
export AMI=$(tail -5 /tmp/ami-output | grep -o 'ami-.*')
cd -

echo ${AMI}