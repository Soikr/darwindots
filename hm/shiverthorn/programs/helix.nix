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

      # CSS
      vscode-css-languageserver

      # Yaml
      yaml-language-server

      # Markdown
      marksman
    ];
    defaultEditor = true;

    languages = {
      language-server = {
        nixd.command = lib.getExe pkgs.nixd;
        lua-language-server.command = lib.getExe pkgs.lua-language-server;
        clangd = {
          command = "${pkgs.clang-tools}/bin/clangd";
          clangd.fallbackFlags = ["-std=c++2b"];
        };
        vscode-css-language-server.command = "${pkgs.vscode-css-languageserver}/bin/vscode-css-language-server";
        yaml-language-server.command = lib.getExe pkgs.yaml-language-server;
        marksman.command = lib.getExe pkgs.marksman;
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
          name = "c";
          auto-format = true;
          language-servers = ["clangd"];
          formatter = {
            command = "${pkgs.clang-tools}/bin/clang-format";
            args = ["--style=file"];
          };
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
