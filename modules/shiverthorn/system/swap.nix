# https://wiki.nixos.org/wiki/Swap
# https://wiki.nixos.org/wiki/Btrfs#Swap_file
{
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  # Replace zram with zswap later
  # boot.kernelParams = [
  #   "zswap.enabled=1" # enables zswap
  #   "zswap.compressor=lz4" # compression algorithm
  #   "zswap.max_pool_percent=20" # maximum percentage of RAM that zswap is allowed to use
  #   "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
  # ];
}
