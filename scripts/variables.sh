#!/bin/bash
set -e

echo "Setting Consul variables"
sudo mkdir -p /opt/consul
sudo mv /tmp/consul-server-addr /opt/consul/server-addr
sudo mv /tmp/consul-server-count /opt/consul/server-count
sudo mv /tmp/consul-atlas-token /opt/consul/atlas-token
sudo mv /tmp/atlas-name /opt/consul/atlas-name
sudo mv /tmp/consul-datacenter /opt/consul/datacenter
