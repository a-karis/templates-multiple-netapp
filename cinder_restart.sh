#!/bin/bash
pcs resource restart openstack-cinder-volume 1>/dev/null 2>&1 &
