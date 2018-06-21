from i3pystatus import Status
from i3pystatus.weather import weathercom
from i3pystatus.calendar import google


status = Status(logfile='/home/yman/var/i3pystatus.log')

status.register("clock",
    format="%a %-d %b %X",)

status.register("load")
status.register("temp")

status.register("network",
    interface="enp0s31f6",
    format_up="{v4} ▲:{bytes_sent} ▼:{bytes_recv}",)

status.register("disk",
    path="/",
    format="{avail}G",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
#    format="{title}{status}{album}",
#    status={
#        "pause": "▷",
#        "play": "▶",
#        "stop": "◾",
#    },)

status.register(
    'weather',
    format='{condition} {current_temp}{temp_unit}[ {update_error}]',
    interval=900,
    colorize=True,
    hints={'markup': 'pango'},
    backend=weathercom.Weathercom(
        location_code='USAZ0247:1:US', # Tucson, AZ
        units='imperial',
        update_error='<span color="#ff0000">!</span>',
    ),
)

status.register("calendar",
    format="{title} {remaining}",
    update_interval=10,
    urgent_blink=True,
    backend=google.Google(
        credential_path='/home/yman/.gcalcli_gmail/oauth',
        days=2))

status.register("calendar",
    format="{title} {remaining}",
    update_interval=10,
    urgent_blink=True,
    backend=google.Google(
        credential_path='/home/yman/.gcalcli_catmail/oauth',
        days=2))

status.register("cmus",
    format="{status} {song_elapsed} {title}")

status.register("pulseaudio",
    format="♪{volume}",)

status.run()
