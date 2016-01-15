#!/bin/sh

# run consul-template in the background
/usr/bin/consul-template -config=/target_groups.json $* &

# and Prometheus in the background
/bin/prometheus -config.file=/etc/prometheus/prometheus.yml \
				-storage.local.path=/prometheus \
				-web.console.libraries=/etc/prometheus/console_libraries \
				-web.console.templates=/etc/prometheus/consoles \