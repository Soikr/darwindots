{
  buildNpmPackage,
  fetchFromGitHub,
  lib,
  makeWrapper,
  nodejs,
  withTray ? false,
}: let
  variant =
    if withTray
    then {
      script = "Server/linux_tray_server.js";
      output = "discord-rpc-server-tray";
    }
    else {
      script = "server.js";
      output = "discord-rpc-server";
    };
in
  buildNpmPackage (finalAttrs: {
    pname = "discord-rpc-extension";
    version = "0.3.0";

    src = fetchFromGitHub {
      owner = "lolamtisch";
      repo = "Discord-RPC-Extension";
      tag = finalAttrs.version;
      hash = "sha256-vbBZ8AlmAqEBPOKI5afqo+LnzNvKViRG0PBgs/PzRIg=";
    };
    npmDepsHash = "sha256-4fwWd8tKE1aSMsEY+iU8rbngt4vavjH+85f2x1Hya7w=";

    dontNpmBuild = true;
    nativeBuildInputs = [
      makeWrapper
      nodejs
    ];

    postInstall = ''
      makeWrapper ${nodejs}/bin/node $out/bin/${variant.output} \
        --add-flags $out/lib/node_modules/discord-rpc/${variant.script} \
        --set NODE_PATH "$out/lib/node_modules"
    '';

    meta = {
      description = "Discord Rich Presence extension server";
      homepage = "https://github.com/lolamtisch/Discord-RPC-Extension";
      license = lib.licenses.gpl3Only;
      platforms = ["x86_64-linux" "x86_64-darwin"];
    };
  })
