#!/bin/bash
# installs software and configures an EC2 instance for use as a
# Ruby/Rails development/education machine
# rex 2016.0715.1620

echo "BEGIN aws-ruby-rails.sh" >> /home/ubuntu/arr-provision.log

##############################################################################
# set the hostname

echo "aws-ruby-rails.sh : Set hostname to aws-ruby-rails" >> /home/ubuntu/arr-provision.log

hostname aws-ruby-rails

echo "aws-ruby-rails" > /etc/hostname

sed -i 's/localhost/localhost aws-ruby-rails/g' /etc/hosts

#############################################################################
# set custom prompt and functions/aliases in .bashrc for users root and ubuntu

echo "aws-ruby-rails.sh :  Set .bashrc customization for root and ubuntu" >> /home/ubuntu/arr-provision.log

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /home/ubuntu/.bashrc

cat ./aws-ruby-rails-master/bashrc-mod.txt >> /root/.bashrc

############################################################################
# install unzip
echo "aws-ruby-rails.sh : apt-get -y install unzip" >> /home/ubuntu/arr-provision.log
apt-get -y install unzip

############################################################################
# install ruby/rails and related tools/software

echo "aws-ruby-rails.sh : wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip" >> /home/ubuntu/arr-provision.log
wget -O ruby-rails-install.zip https://github.com/addiscent/ruby-rails-install/archive/master.zip

echo "aws-ruby-rails.sh : unzip ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
unzip ruby-rails-install.zip

echo "aws-ruby-rails.sh : chmod +x ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
chmod +x ./ruby-rails-install-master/ruby-rails-install.sh

echo "aws-ruby-rails.sh : ./ruby-rails-install-master/ruby-rails-install.sh" >> /home/ubuntu/arr-provision.log
./ruby-rails-install-master/ruby-rails-install.sh >> /home/ubuntu/arr-provision.log

echo "aws-ruby-rails.sh : rm -r ./ruby-rails-install-master" >> /home/ubuntu/arr-provision.log
rm -r ./ruby-rails-install-master

echo "aws-ruby-rails.sh : rm ruby-rails-install.zip" >> /home/ubuntu/arr-provision.log
rm ruby-rails-install.zip

echo "END aws-ruby-rails.sh" >> /home/ubuntu/arr-provision.log

