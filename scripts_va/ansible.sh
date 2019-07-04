#!/bin/sh
apt-get update
apt install -y sudo sshpass python3-pip
pip3 install ansible
useradd ansible -m -s "/bin/bash"
usermod -aG sudo ansible
passwd ansible << EOF
vagrant
vagrant
EOF
echo "10.0.3.154 node1" >> /etc/hosts
echo "10.0.3.155 node2" >> /etc/hosts
mkdir -p /etc/ansible
echo "# config file for ansible -- https://ansible.com/" > /etc/ansible/ansible.cfg
echo "# ===============================================" >> /etc/ansible/ansible.cfg
echo '[defaults]' >> /etc/ansible/ansible.cfg
echo "inventory      = /etc/ansible/hosts" >> /etc/ansible/ansible.cfg
echo 'host_key_checking = False' >> /etc/ansible/ansible.cfg
echo "node1" > /etc/ansible/hosts
echo "node2" >> /etc/ansible/hosts
su - ansible -c "ssh-keygen -f /home/ansible/.ssh/id_rsa -q -P ''"
echo "vagrant" > /home/ansible/password.txt
su - ansible -c "sshpass -f password.txt ssh-copy-id node1; true"
