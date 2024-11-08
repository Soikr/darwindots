{
  stdenv,
  fetchFromGitHub,
  clang,
  gcc,
  readline,
}:
stdenv.mkDerivation {
  pname = "sketchybar-lua";
  version = "main";

  src = fetchFromGitHub {
    owner = "FelixKratz";
    repo = "SbarLua";
    rev = "437bd2031da38ccda75827cb7548e7baa4aa9978";
    sha256 = "sha256-F0UfNxHM389GhiPQ6/GFbeKQq5EvpiqQdvyf7ygzkPg=";
  };

  nativeBuildInputs = [clang gcc];
  buildInputs = [readline];

  installPhase = ''
    runHook preInstall
    mv bin "$out"
    runHook postInstall
  '';
}
