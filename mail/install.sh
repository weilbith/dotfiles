sudo pacman -S --noconfirm neomutt isync msmtp notmuch lynx khard khal
trizen -S vdirsyncer ripmime
pip install --user requests-oauthlib

XDG_CONFIG=$HOME/.config
MAIL_DIR=$HOME/Mail
MUTT_CONFIG_DIR=$HOME/.mutt
MUTT_CACHE=$HOME/.cache/mutt
ACC_CONFIG_DIR=$MUTT_CONFIG_DIR/accounts
NM_HOOK_DIR=$MAIL_DIR/.notmuch/hooks
SYSTEMD_DIR=$XDG_CONFIG/systemd/user
VDIRSYNCER_DIR=$XDG_CONFIG/vdirsyncer
VDIRSYNCER_CACHE=$HOME/.cache/vdirsyncer
CONTACT_DIR=$HOME/Contacts
CALENDAR_DIR=$HOME/Calendar


mkdir -p $MAIL_DIR
mkdir -p $MUTT_CONFIG_DIR
mkdir -p $MUTT_CACHE
mkdir -p $ACC_CONFIG_DIR
mkdir -p $NM_HOOK_DIR
mkdir -p $SYSTEMD_DIR
mkdir -p $VDIRSYNCER_DIR
mkdir -p $VDIRSYNCER_CACHE
mkdir -p $CONTACT_DIR/brainbot_gsuite
mkdir -p $CONTACT_DIR/private_nextcloud

#openssl s_client -connect mail.brainbot.com:20025 -starttls smtp | sed -ne '/--BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
#openssl s_client -connect mail.brainbot.com:25 -starttls smtp < /dev/null 2>/dev/null | openssl x509 -fingerprint -noout | cut -d'=' -f2

ln -sf $(pwd)/mutt/* $MUTT_CONFIG_DIR/
ln -sf $(pwd)/mbsyncrc $HOME/.mbsyncrc
ln -sf $(pwd)/mbsync.* $SYSTEMD_DIR/
ln -sf $(pwd)/msmtprc $HOME/.msmtprc
ln -sf $(pwd)/notmuch/notmuch-config $HOME/.notmuch-config
ln -sf $(pwd)/notmuch/hooks/* $NM_HOOK_DIR/
ln -sf $(pwd)/mailcap $HOME/.mailcap
ln -sf $(pwd)/vdirsyncer $VDIRSYNCER_DIR/config
ln -sf $(pwd)/vdirsyncer/vdirsyncer.* $SYSTEMD_DIR/
ln -sf $(pwd)/khal $XDG_CONFIG/
ln -sf $(pwd)/khard $XDG_CONFIG/

chmod 600 $(pwd)/msmtprc
chmod 700 $(pwd)/notmuch/hooks/*

systemctl --user daemon-reload
systemctl --user enable mdsync.timer
systemctl --user enable vdirsyncer.timer
systemctl --user start mdsync.timer
systemctl --user start vdirsyncer.timer

# Make sure to have the scripts repository checked out.
notmuch new

