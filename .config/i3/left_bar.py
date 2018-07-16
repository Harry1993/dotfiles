from i3pystatus import Status
from i3pystatus.weather import weathercom
from i3pystatus.calendar import google
from i3pystatus.mail import imap

# check out i3pystatus.core.settings.get_setting_from_keyring()
# for implementing a keyring ourselves
from get_gpw import gkey
from get_cpw import ckey

status = Status(logfile='/home/yman/var/i3pystatus.log')

status.register("clock",
    format="📆 %D %a 🕒 %I:%M %p",)

status.register("cpu_usage",
    format="🔥 {usage}%")
status.register("temp",
    format="🌡️ {temp} °C")
status.register("mem",
    format="🐏 {percent_used_mem}%")

status.register("shell",
    command="/usr/bin/dig +short myip.opendns.com @resolver1.opendns.com",
    format="🌐 {output}")

status.register("network",
    interface="enp0s31f6",
    format_up="{bytes_sent} ⇅ {bytes_recv}",)

status.register("openvpn",
    vpn_name='Windscribe-US-West',
    format='🔞🈲 {status}',
    status_down='down',
    status_up='up')

status.register("disk",
    path="/",
    format="💽 {avail}G",)

#status.register("net_speed")

status.run()
