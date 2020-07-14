interface="$1"
interface_wireless="wlp4s0"
connection_id_work="FULLNODE"
rocketchat_command="rocketchat-desktop"
rocketchat_desktop_entry="/usr/share/applications/${rocketchat_command}.desktop"

[[ "$interface" != "$interface_wireless" ]] && exit
[[ "$CONNECTION_ID" != "$connection_id_work" ]] && exit
command -v "$rocketchat_command" || exit
command -v "dex" || exit
[[ ! -f "$rocketchat_desktop_entry" ]] && exit
ps aux | grep -v grep | grep -q "$rocketchat_command" && exit

dex "$rocketchat_desktop_entry" >/tmp/test.log 2>&1
