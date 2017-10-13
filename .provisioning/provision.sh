#!/bin/bash
 
ANSIBLE_PLAYBOOK=$1
ANSIBLE_HOSTS=$2
TEMP_HOSTS="/tmp/ansible_hosts"
 
if [ ! -f /vagrant/$ANSIBLE_PLAYBOOK ]; then
 echo "Cannot find Ansible playbook"
 exit 1
fi
 
if [ ! -f /vagrant/$ANSIBLE_HOSTS ]; then
 echo "Cannot find Ansible hosts"
 exit 2
fi
 
if ! [ `which ansible` ]; then
 wget http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
 sudo rpm --import RPM-GPG-KEY-EPEL-6
 wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
 sudo rpm -ivh epel-release-6-8.noarch.rpm
 sudo yum install -y ansible
fi
 
cp /vagrant/${ANSIBLE_HOSTS} ${TEMP_HOSTS}
chmod -x ${TEMP_HOSTS}
echo "Running Ansible"
bash -c "ansible-playbook /vagrant/${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --connection=local"
rm ${TEMP_HOSTS}
