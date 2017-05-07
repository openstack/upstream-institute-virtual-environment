#!/usr/bin/env bash

REPO=$(dirname "$(readlink -f "$0")")/

# Install devstack
sudo mkdir /opt/devstack
sudo chown -R "$USER:$GROUP" /opt/devstack

git clone --depth=1 https://git.openstack.org/openstack-dev/devstack \
                    /opt/devstack
cp -ar "$REPO/files/opt" /

/opt/devstack/stack.sh

# Enable OFFLINE mode for next invoking stack.sh to be faster
sed -i 's/#OFFLINE=/OFFLINE=/' /opt/devstack/local.conf

# Configure mysql to operate with less memory
sudo tee -a /etc/mysql/my.cnf << EOF
# Courtesy of Morgan Tocker
# http://www.tocker.ca/2014/03/10/configuring-mysql-to-use-minimal-memory.html
[mysqld]
innodb_buffer_pool_size=5M
innodb_log_buffer_size=256K
query_cache_size=0
key_buffer_size=8
thread_cache_size=0
host_cache_size=0
innodb_ft_cache_size=1600000
innodb_ft_total_cache_size=32000000

# per thread or per operation settings
thread_stack=131072
sort_buffer_size=32K
read_buffer_size=8200
read_rnd_buffer_size=8200
max_heap_table_size=16K
tmp_table_size=1K
bulk_insert_buffer_size=0
join_buffer_size=128
net_buffer_length=1K
innodb_sort_buffer_size=64K

#settings that relate to the binary log (if enabled)
binlog_cache_size=4K
binlog_stmt_cache_size=4K
EOF

sudo service mysql restart

# Unstack
/opt/devstack/unstack.sh
