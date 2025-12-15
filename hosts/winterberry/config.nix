{lib, ...}:
with lib; {
  options.my = {
    user = mkOption {
      type = types.str;
      default = "soikr";
    };

    hostname = mkOption {
      type = types.str;
      default = "winterberry";
    };
  };
}
