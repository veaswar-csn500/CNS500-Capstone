# Summary of Checkpoint3


## Table of Contents


## Project Summary

- Configure a DNS server in WS-XX

- Configure DNS server and name on LS-XX, WC-XX and LR-XX

- Install, configure and SSh, FTP, MariaDB,Apache services and test them on the Windows and Linux Servers

- Configure the iptables and firewall on the Jump Server to allow traffic from your networks to access services on standard ports

- XX - Unique student id number

- XXXXXX - Student-RG number in Azure portal

## Initial Configuration

- Make sure to deploy all VMs and to enable iptables on LR-XX and LS-XX

- Make sure the Vms get the respective static IPs. (LS-XX : 172.17.XX.36, WS-XX : 172.17.XX.37, LR-XX : 192.168.XX.36)

- DNS to be configured in WS-XX and make sure the LS-XX,LR-XX and WC-XX.


## Template .JSON Files

- [WC-48](WC-48.json)

- [WS-48](WS-48.json)

- [LR-48](LR-48.json)

- [LS-48](LS-48.json)

## Bash Script to Deploy the VMs

- [Deploy VMs](VMDeploy.bash)

## CLI command to set static IP
