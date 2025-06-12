{...}: {
  programs.kitty = {
    enable = true;
    darwinLaunchOptions = ["--single-instance"];
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    shellIntegration.enableZshIntegration = true;
    themeFile = "Hardcore";
    settings = {
      cursor_shape = "underline";
      mouse_hide_wait = -1;
      show_hyperlink_targets = "yes";
      strip_trailing_spaces = "smart";
      enable_audio_bell = "no";
      tab_bar_style = "powerline";
      #background_opacity = "0.8";
      #background_blur = 48;
      update_check_interval = 0;
      macos_option_as_alt = "yes";
      macos_quit_when_last_window_closed = "yes";
      macos_colorspace = "displayp3";
      hide_window_decorations = "titlebar-only";
      window_margin_width = 3;
      window_padding_width = 3;
    };
  };
}
