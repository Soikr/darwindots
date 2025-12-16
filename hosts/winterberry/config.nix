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

    diskID = mkOption {
      type = types.str;
      default = "ata-WDC_WD10EZEX-75WN4A0_WD-WCC6Y7LYP330";
    };
  };
}
