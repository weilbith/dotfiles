# Cerebro
## Configuration
CEREBRO_DIR=$HOME/.config/Cerebro
mkdir -p "$CEREBRO_DIR"
ln -sf "$(pwd)/cerebro/config.json" "$CEREBRO_DIR/"

## Start the application ones to create some stuff at the configuration directory.
ln -sf "$(pwd)/cerebro/plugins.json" "$CEREBRO_DIR/plugins/package.json"
cd "$CEREBRO_DIR/plugins" && yarn install
