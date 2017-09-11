#!/bin/bash
latest_version="$(curl http://download.cirros-cloud.net/version/released)"
wget http://download.cirros-cloud.net/"${latest_version}"/cirros-"${latest_version}"-x86_64-disk.img
mv cirros-*.img cirros/