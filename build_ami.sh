#!/usr/bin/env bash
# https://www.davidbegin.com/packer-and-terraform/
# todo: https://www.davidbegin.com/a-packer-terraform-structure/
set -e

packer build -var-file=variables.json template.json | tee output/packer_output.txt

cat output/packer_output.txt | tail -n 2 \
  | sed '$ d' \
  | sed "s/ap-south-1: /packer_built_bastion_ami = \"/" \
  | sed -e 's/[[:space:]]*$/\"/' > packer_ami.tfvars

cat packer_ami.tfvars
