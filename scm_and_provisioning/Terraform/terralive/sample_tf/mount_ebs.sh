#!/bin/bash

mkfs -t ext4 /dev/xvdg
mkdir /opt/jenkins_mount
mount /dev/xvdg /opt/jenkins_mount
echo /dev/xvdg /opt/jenkins_mount ext4 defaults,nofail 0 2 >> /etc/fstab


