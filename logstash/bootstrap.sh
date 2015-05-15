#!/usr/bin/env bash

cp /vagrant/conf/10-logstash.conf /etc/rsyslog.d/10-logstash.conf
service rsyslog restart
