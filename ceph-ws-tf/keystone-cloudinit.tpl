#cloud-config

package_update: true

packages:
 - python-dev
 - libssl-dev 
 - python-pip 
 - apache2
 - libapache2-mod-wsgi
 - libldap2-dev
 - libsasl2-dev
 - keystone
 - debconf-utils

package_upgrade: true

power_state:
 mode: poweroff
 condition: True
