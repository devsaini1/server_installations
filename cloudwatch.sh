sudo wget https://amazoncloudwatch-agent-ap-south-1.s3.ap-south-1.amazonaws.com/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb
ls
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb  # :- this is used to install a Debian package (amazon-cloudwatch-agent.deb) using the dpkg package management tool with certain options
## apt-get update && apt-get install collectd:- This command attempts to install the package named collectd using the APT (Advanced Package Tool) package management system. collectd is a system statistics collection daemon. If the apt-get update command completes successfully, this command will install collectd on the system.
sudo apt-get update && apt-get install collectd
ls
sudo rm amazon-cloudwatch-agent.deb
ls
sudo amazon-cloudwatch-agent-ctl
