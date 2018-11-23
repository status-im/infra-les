# Description

This repo defines Geth LES nodes clusters.

# Requirements

In order to use this you will need secrets(passwords, certs, keys) contained within the [infra-pass](https://github.com/status-im/infra-pass) repository. If you can't see it ask jakub@status.im to get you access for it.

In order for this to work first you need to install necessary Terraform plugins and get the right secrets from the [infra-pass](https://github.com/status-im/infra-pass) repo, to do that simply run:
```
make
# alternatively
make plugins
make secrets
```
This will put the necessary certificates, keys, and passwords are in place so you can deploy and configure hosts.

# Usage

To deploy hosts for the subsystem you want - for example `discourse` - simply run:
```
terraform plan
terraform apply
```
Then configure clusters:
```
ansible-playbook ansible/main.yml
```
