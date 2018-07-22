# Install i3 gaps.
# TODO: Install it...

I3_CONFIG_DIR=$HOME/.config/i3
mkdir -p $I3_CONFIG_DIR
ln -sf $(pwd)/config $I3_CONFIG_DIR/


# Install Powerstatus10k.
POWERSTATUS10K_DIR=$HOME/Tools/powerstatus10k

if [[ ! -d "$POWERSTATUS10K_DIR" ]] ; then
  mkdir -p $POWERSTATUS10K_DIR
  git clone --depth 1 https://github.com/weilbith/powerstatus10k.git $POWERSTATUS10K_DIR
fi

ln -sf $(pwd)/powerstatus10k_custom.conf $POWERSTATUS10K_DIR/config/custom.conf
