all: network_load menus

network_load: network_load.c network_load.h sketchybar.h
	clang -std=c99 -O3 $< -o $@

menus: menus.c
	clang -std=c99 -O3 -F/System/Library/PrivateFrameworks/ -framework Carbon -framework SkyLight $< -o $@
