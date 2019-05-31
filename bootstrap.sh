#!/bin/sh

# Install prerequisites
yum install -y https://centos7.iuscommunity.org/ius-release.rpm epel-release
yum -y update
yum install -y git2u ansible

# Clone daf-infra-ansible-cloudera repository
rm -rf daf-infra-cloudera-bootstrap
GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone https://github.com/teamdigitale/daf-infra-cloudera.git

pushd daf-infra-cloudera-bootstrap

ansible-playbook bootstrap.yml -i inventory/hosts-dev.yml
