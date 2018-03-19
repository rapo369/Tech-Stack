Installation
http://docs.ansible.com/ansible/latest/intro_installation.html

→ ansible version - 2.3
→ required python 2.6 or 2.7 for control machine( Windows isn’t supported for the control machine)

$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible

You may also wish to run from source to get the latest, which is covered above.
Latest Releases Via Apt (Debian)
Debian users may leverage the same source as the Ubuntu PPA.
Add the following line to /etc/apt/sources.list:
deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main


Then run these commands:
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
$ sudo apt-get update
$ sudo apt-get install ansible



Installation in Centos
→ yum install ansible

You can do it either in the /etc/ansible/ansible.cfg or ~/.ansible.cfg file:
[defaults] host_key_checking = False
→ ansible all -m ping

http://docs.ansible.com/ansible/latest/intro_inventory.html

http://docs.ansible.com/ansible/latest/intro_dynamic_inventory.html



