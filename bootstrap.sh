#!/bin/sh

# Install prerequisites
yum install -y https://centos7.iuscommunity.org/ius-release.rpm epel-release
yum -y update
yum install -y git2u ansible

# Clone daf-infra-ansible-cloudera repository
GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:teamdigitale/daf-infra-ansible-cloudera.git

ansible-playbook bootstrap.yml
