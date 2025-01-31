{
  stdenvNoCC,
  lib,
  fetchurl,
  _7zz,
  accelerated ? false,
}: let
  Version = "2.8.3";
  Hash = "";
  AcceleratedHash = "sha256-mwJSbdHR7mAKSZR/ASqcRop1OGw1PyZUhaQenefUQic=";
in
  stdenvNoCC.mkDerivation (finalAttrs: {
    pname = "CraftOS-PC" + lib.optionalString accelerated "-Accelerated";
    version = "v${Version}" + lib.optionalString accelerated "-luajit";

    src = fetchurl {
      url = "https://github.com/MCJack123/craftos2/releases/download/${finalAttrs.version}/CraftOS-PC.dmg";
      hash =
        if accelerated
        then AcceleratedHash
        else Hash;
    };

    dontBuild = true;
    dontFixup = true;

    nativeBuildInputs = [_7zz];

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall

      mkdir -p $out/Applications
      cp -R *.app $out/Applications

      runHook postInstall
    '';
  })
