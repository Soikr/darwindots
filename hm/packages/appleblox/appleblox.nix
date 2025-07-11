{
  stdenvNoCC,
  fetchurl,
  undmg,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "AppleBlox";
  version = "0.8.6";

  src = fetchurl {
    url = "https://github.com/AppleBlox/appleblox/releases/download/${finalAttrs.version}/AppleBlox-${finalAttrs.version}_x64.dmg";
    hash = "sha256-MOWAnvZepYWqbnlLRB5zHDTi4hyl0cKVy/AuJvDpSzs=";
  };

  dontBuild = true;
  dontFixup = true;

  nativeBuildInputs = [undmg];

  sourceRoot = "AppleBlox.app";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications/AppleBlox.app
    cp -R . $out/Applications/AppleBlox.app

    runHook postInstall
  '';
})
