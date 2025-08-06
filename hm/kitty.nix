{
  programs.kitty = {
    enable = true;
    darwinLaunchOptions = ["--single-instance"];
    enableGitIntegration = true;
    themeFile = "Hybrid";
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };
    settings = {
      cursor_shape = "underline";
      strip_trailing_spaces = "always";
      enable_audio_bell = "no";
      tab_bar_style = "powerline";
      tab_title_template = "{index}";
      update_check_interval = 0;
      macos_option_as_alt = "yes";
      macos_quit_when_last_window_closed = "yes";
      macos_colorspace = "default";
      hide_window_decorations = "titlebar-only";
      window_margin_width = "0 15";
      window_border_width = 0;
    };
  };
}
