{
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    extraPackages = with pkgs; [
      # Nix
      nixd
      statix
      deadnix
      alejandra

      # Lua
      lua-language-server
      stylua

      # Markdown
      marksman
    ];
    defaultEditor = true;

    languages = {
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        lua.command = lib.getExe pkgs.lua-language-server;
        markdown.command = lib.getExe pkgs.marksman;
      };

      language = [
        {
          name = "nix";
          auto-format = true;
          language-servers = ["nixd"];
          formatter.command = lib.getExe pkgs.alejandra;
        }
        {
          name = "lua";
          auto-format = true;
          language-servers = ["lua-language-server"];
          formatter.command = lib.getExe pkgs.stylua;
        }
        {
          name = "markdown";
          language-servers = ["marksman"];
        }
      ];
    };

    settings = {
      theme = "hybrid";
      keys.normal = {
        "Meta-f" = ":format";
      };
    };

    themes = {
      hybrid = {
        inherits = "kanagawa-dragon";

        palette = {
          dragonBlack3 = "#161719";
          dragonBlack4 = "#161719";
        };
      };
    };
  };
}
