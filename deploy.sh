#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
template_base_dir="$DIR"

openstack overcloud deploy --templates -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml -e ${template_base_dir}/network-environment.yaml -e ${template_base_dir}/environment-cinder-multiple-netapp.yaml --control-scale 1 --compute-scale 1 --ceph-storage-scale 0 --control-flavor control --compute-flavor compute --ceph-storage-flavor ceph-storage --ntp-server pool.ntp.org --neutron-network-type vxlan --neutron-tunnel-types vxlan #--debug 2>&1
