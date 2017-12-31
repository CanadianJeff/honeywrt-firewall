#!/bin/sh
opkg update
opkg install ipset
opkg install kmod-ipt-ipset
opkg install ncat
opkg install iptables-mod-ulog
opkg install iptables-mod-nflog
opkg install ulogd
opkg install ulogd-mod-extra
opkg install ulogd-mod-json
opkg install ulogd-mod-nfct
/etc/init.d/ulogd enable
