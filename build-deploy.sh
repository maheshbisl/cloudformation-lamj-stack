mvn integration-test

ls target/mahesh-webserver.war
ln -f target/mahesh-webserver.war packer/mahesh-webserver.war

function sceptre_launch()
{
    cd sceptre
    sceptre launch --yes $1
    cd -
}

sceptre_launch vpc-alb-rds

#pass DNS of DB and loadbalancer to packer
function get_export()
{
    echo `aws cloudformation list-exports --region ap-southeast-2 | jq -r '.Exports[] | select(.Name=="'${1}'") | .Value'`
}
DB_DNS=$(get_export maheshdbInternalDNS)
LB_DNS=$(get_export ALBDNSName)

# Packer build
cd packer
cat << EOF > environment.txt
DB_DNS=${DB_DNS}
LB_DNS=${LB_DNS}
EOF

packer build packer.json | tee /tmp/ami-output
export AMI=$(tail -5 /tmp/ami-output | grep -o 'ami-.*')

cd -

echo ${AMI}
sceptre_launch asg

# test if the deployment is ok
curl --silent --output /dev/null  http://${LB_DNS}/mahesh-webserver/ && echo "Deployment Success"