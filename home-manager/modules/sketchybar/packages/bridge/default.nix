{
  overrideSDK,
  lib,
  darwin,
  pkgs,
}: let
  stdenv = overrideSDK pkgs.stdenv "11.0";
in
  stdenv.mkDerivation {
    pname = "sketchybar-bridge";
    version = "0.0.0.0";
    src = lib.sourceFilesBySuffices ./. ["makefile" ".c" ".h"];

    buildInputs = with darwin.apple_sdk.frameworks; [
      Carbon
      SkyLight
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/bin"
      mv network_load "$out/bin/network_load"
      mv menus "$out/bin/menus"

      runHook postInstall
    '';
  }
