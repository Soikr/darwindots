{ ... }:
let

  dots = "${inputs.sketchybar}/.config/sketchybar";
  config = ".config/sketchybar"

in {
  home.file = {
    "${config}/sketchybarrc".source = ./;
    "${config}/icons.sh".source = ./;
    "${config}/colors.sh".source = ./;
    "${config}/plugins/window_title.sh".source = ./plugins/;
    "${config}/plugins/wifi_click.sh".source = ./plugins/;
    "${config}/plugins/wifi.sh".source = ./plugins/;
    "${config}/plugins/space.sh".source = ./plugins/;
    "${config}/plugins/darkmode_click.sh".source = ./plugins/;
    "${config}/plugins/darkmode.sh".source = ./plugins/;
    "${config}/plugins/cpu.sh".source = ./plugins/;
    "${config}/plugins/clock.sh".source = ./plugins/;
    "${config}/items/window_title.sh".source = ./items/;
    "${config}/items/wifi.sh".source = ./items/;
    "${config}/items/spaces.sh".source = ./items/;
    "${config}/items/darkside.sh".source = ./items/;
    "${config}/items/cpu.sh".source = ./items/;
    "${config}/items/clock.sh".source = ./items/;
    "${config}/items/apple.sh".source = ./items/;
  };
}
