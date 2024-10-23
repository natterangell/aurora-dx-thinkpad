#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# Install thinkfan, tlp, igt-gpu-tools and displaylink kernel module
#rpm-ostree install tlp thinkfan igt-gpu-tools /tmp/rpms/kmods/*evdi*.rpm
#
# Add displaylink/evdi and howdy
#rpm-ostree install /tmp/rpms/kmods/*evdi*.rpm howdy howdy-gtk
rpm-ostree install howdy howdy-gtk

#Disable negativo repo after installing displaylink, as it otherwise conflicts with RPM-fusion, and disable howdy too, for good measure
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/fedora-multimedia.repo
sed -i 's@enabled=1@enabled=0@g' /etc/yum.repos.d/howdy-copr.repo 

# Mask power-profiles-daemon in order for tlp to work correctly
#systemctl mask power-profiles-daemon.service
