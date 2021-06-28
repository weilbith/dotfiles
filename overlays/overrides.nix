channels: final: prev: {
  __dontExport = true;

  inherit (channels.latest)
    cachix
    rage # Used for the secret encryption in DevOS.
    nixpkgs-fmt
}
