## HoneyWRT Firewall
# Setup
On your router install the required packages using setup.sh<br>
Install ulogd.conf into /etc/ulogd.conf<br>
Restart ULOGD: `/etc/init.d/ulogd restart`<br>
Create whitelist set of IPs save into /etc/whitelist.db<br>
Create custom set of IPs save into /etc/custom.db<br>
Generate torexit set of IPs save into /etc/tor_exit.db<br>
Install firewall.user into /etc/firewall.user<br>
Restart Firewall: `/etc/init.d/firewall restart`<br>
<br>
Have NCAT send json over TCP 9999 (so ELK stack can suck it in)<br>
The --send-only option prevents attackers from sending data to the port<br>
`ncat -vlk -p 9999 --send-only -e '/bin/cat /var/log/ulogd.json' 1>/dev/null 2>/dev/null &`<br>
Port 9999 is forwarded from wan to router using a rule you can change or disable this as needed<br>
# /etc/config/firewall
If you want to use the IPSETS created in firewall.user with your rules and redirections add this
```
config ipset
    option external 'WHITELIST'
    option match 'src_net'
    option storage 'hash'
```
# Future Work
Store rulesets in the cloud<br>
