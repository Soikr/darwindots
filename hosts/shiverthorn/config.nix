{lib, ...}:
with lib; {
  options.my = {
    user = mkOption {
      type = types.str;
      default = "soikr";
    };

    hostname = mkOption {
      type = types.str;
      default = "shiverthorn";
    };

    diskID = mkOption {
      type = types.str;
      default = "ata-JAJS600M2TB_AA202200000031005416";
    };
  };
}
