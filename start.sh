#!/bin/bash

service rsyslog restart
/usr/lib/postfix/sbin/master -c /etc/postfix -d