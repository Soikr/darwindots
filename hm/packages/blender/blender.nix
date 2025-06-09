{
  stdenvNoCC,
  fetchurl,
  undmg,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "Blender";
  version = "3.6.9";

  src = fetchurl {
    url = "https://download.blender.org/release/Blender3.6/blender-3.6.9-macos-x64.dmg";
    hash = "sha256-UoYZ8MIh7dY4iKGXQXg+/DGqB4lKSTX98ng2NQWhDFQ=";
  };

  dontBuild = true;
  dontFixup = true;

  nativeBuildInputs = [undmg];

  sourceRoot = "Blender.app";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications/Blender.app
    cp -R . $out/Applications/Blender.app

    runHook postInstall
  '';
})
