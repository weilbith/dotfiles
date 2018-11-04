# Install packages.
sudo pacman -S --noconfirm neomutt isync msmtp notmuch lynx khard khal
trizen -S vdirsyncer ripmime urlscan-git
pip install --user requests-oauthlib

# Define directory variables.
CONTACT_DIR=$HOME/Contacts
CALENDAR_DIR=$HOME/Calendar

MUTT_CACHE=$XDG_CACHE_HOME/mutt
VDIRSYNCER_CACHE=$XDG_CACHE_HOME/vdirsyncer
ACC_CONFIG_DIR=$MUTT_DIR/accounts
NOTMUCH_DATABASE_PATH=$MAIL/.notmuch

# Create directories.
mkdir -p $MAIL
mkdir -p $CONTACT_DIR/brainbot_gsuite
mkdir -p $CONTACT_DIR/private_nextcloud

mkdir -p $MUTT_CACHE
mkdir -p $ACC_CONFIG_DIR
mkdir -p $NOTMUCH_DATABASE_PATH
mkdir -p $VDIRSYNCER_CACHE

# Link dotfiles to the respective locations.
ln -sf $(pwd)/mailcap $HOME/.mailcap
ln -sf $(pwd)/notmuch/hooks $NOTMUCH_DATABASE_PATH/

ln -sf $(pwd)/mutt $XDG_CONFIG_HOME/
ln -sf $(pwd)/notmuch $XDG_CONFIG_HOME/
ln -sf $(pwd)/isync $XDG_CONFIG_HOME/
ln -sf $(pwd)/msmtp $XDG_CONFIG_HOME/
ln -sf $(pwd)/vdirsyncer $XDG_CONFIG_HOME/
ln -sf $(pwd)/khal $XDG_CONFIG_HOME/
ln -sf $(pwd)/khard $XDG_CONFIG_HOME/
ln -sf $(pwd)/urlscan $XDG_CONFIG_HOME/


# Make sure the Notmuch hooks are executable by user.
chmod 700 $(pwd)/notmuch/hooks/*


# Getting further:
# Checkout the PowerStatus10k segments for Khal and Notmuch.
# Checkout fcron for synchronize everything periodically.


# Get a servicers certificate(-fingerprint):
#openssl s_client -connect mail.brainbot.com:25 -starttls smtp < /dev/null 2>/dev/null | openssl x509 -fingerprint -noout | cut -d'=' -f2
#openssl s_client -connect mail.brainbot.com:20025 -starttls smtp | sed -ne '/--BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
