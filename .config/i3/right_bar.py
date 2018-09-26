from i3pystatus import Status
from i3pystatus.weather import weathercom
from i3pystatus.calendar import google
from i3pystatus.mail import imap

import logging

# check out i3pystatus.core.settings.get_setting_from_keyring()
# for implementing a keyring ourselves
from get_gpw import gkey
from get_cpw import ckey

status = Status(logfile='/home/yman/var/i3pystatus.log')

status.register("clock",
    format="📆 %D %a 🕒 %I:%M %p",)

status.register('weather',
    format='🌈 {condition} {current_temp}{temp_unit}[ {update_error}] 💦 {humidity}%',
    interval=900,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='85721:4:US', # UofA
        #location_code='85704:4:US', # Apt
        units='imperial',
        update_error='<span color="#ff0000">!</span>',
        log_level=logging.DEBUG,
    ),
)

status.register("calendar",
    format="📅 {title}",
    update_interval=10,
    urgent_blink=True,
    backend=google.Google(
        credential_path='/home/yman/.gcalcli_gmail/oauth',
        days=2))

status.register("calendar",
    format="📅 {title}",
    update_interval=10,
    urgent_blink=True,
    backend=google.Google(
        credential_path='/home/yman/.gcalcli_catmail/oauth',
        days=2))

status.register("cmus",
    format="🎵 {song_elapsed} {title}",
    format_not_running="")

status.register("pulseaudio",
    format="🔉 {volume}")

status.register("mail",
    email_client="/usr/bin/mutt",
    format="📨 Gmail: {unread} new email",
    format_plural="Gmail: {unread} new emails",
    backends=[imap.IMAP(
        host='imap.gmail.com',
        username='dlut.manym',
        keyring_backend=gkey,
        mailbox="[Gmail]/Important",
        account='dlut.manym@gmail.com')])

status.register("mail",
    email_client="/usr/bin/mutt",
    format="📨 Catmail: {unread} new email",
    format_plural="Catmail: {unread} new emails",
    backends=[imap.IMAP(
        host='imap.gmail.com',
        username='yman@email.arizona.edu',
        keyring_backend=ckey,
        account='yman@email.arizona.edu@gmail.com')])

#status.register("net_speed")

status.run()
