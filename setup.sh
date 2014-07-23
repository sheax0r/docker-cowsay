#!/bin/bash
set -o errexit
set -o nounset

cat <<-EOF > /etc/yum.repos.d/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 6 - \$basearch
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=\$basearch
failovermethod=priority
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 6 - \$basearch - Debug
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=\$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
gpgcheck=0

[epel-source]
name=Extra Packages for Enterprise Linux 6 - \$basearch - Source
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=\$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
gpgcheck=0
EOF

yum install -y cowsay
yum clean all