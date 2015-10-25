#!/bin/bash
set -e

mkdir /config
cat > /config/server.json << EOF
{
    "acl_datacenter": "${ACL_DATACENTER:-}",
    "acl_default_policy": "${ACL_DEFAULT_POLICY:-}",
    "acl_down_policy": "${ACL_DOWN_POLICY:-}",
    "acl_master_token": "${ACL_MASTER_TOKEN:-}",
    "advertise_addr": "${ADVERTISE_ADDR:-}",
    "bind_addr": "${BIND_ADDR:-}",
    "bootstrap_expect": "${BOOTSTRAP_EXPECT:-}",
    "client_addr": "${CLIENT_ADDR:-}",
    "data_dir": "${DATA_DIR:-}",
    "datacenter": "${DATACENTER:-}",
    "dns_config": {
        "allow_stale": ${DNS_CONFIG_ALLOW_STALE:-}
    }
    "encrypt": "${ENCRYPT:-}",
    "log_level": "${LOG_LEVEL:-}",
    "server": ${SERVER:-true},
    "ui_dir": "/ui",
}
EOF

/bin/consul agent -server -config-dir=/config
