{inputs, pkgs, nix-colors, config, ...}: 

  let 
   imports = [
    "nix-colors.homeManagerModules.default"
  ];
  in

{
  wayland.windowManager.hyprland =  {
    enable = true;

    settings = {

    #monitor = ",preferred,auto,0.75";
    monitor = ",highres,auto,1# unscale XWaylandxwayland {force_zero_scaling = true}# toolkit-specific scaleenv = GDK_SCALE,2env = XCURSOR_SIZE,32";


    "$terminal" = "alacritty";
    "$fileManager" = "dolphin";
    "$menu" = "rofi -show drun";
    "$browser" = "firefox";
    "$blender" = "blender";
    "$virt-manager" = "virt-manager";
    "$locker" = "hyprlock";
    "$wallpaper" = "waypaper";

    "$mainMod" = "CTRL_ALT";
    bind = [
        "$mainMod, C, killactive,"
        "$mainMod, R, exec, $browser"
        "$mainMod, T, exec, $terminal"
        "$mainMod, E, exec, $blender"
        "$mainMod, W, exec, $virt-manager"
        "$mainMod, M, exit,"
        "$mainMod, D, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, RETURN, exec, $menu"
        "$mainMod, O, exec, $wallpaper --random"
        "$mainMod, P, pseudo, "
        "$mainMod, J, togglesplit, "
        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, u"
        "$mainMod, K, movefocus, d"
        "$mainMod, L, movefocus, r"
	"SHIFT_ALT, L, exec, $locker"
        "CTRL, F5, workspace, 1"
        "CTRL, F6, workspace, 2"
        "CTRL, F7, workspace, 3"
        "CTRL, F8, workspace, 4"
        "CTRL, F1, workspace, 5"
        "CTRL, F2, workspace, 6"
        "CTRL, F3, workspace, 7"
        "CTRL, F4, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod_SHIFT, A, movetoworkspace, 1"
        "$mainMod_SHIFT, S, movetoworkspace, 2"
        "$mainMod_SHIFT, D, movetoworkspace, 3"
        "$mainMod_SHIFT, F, movetoworkspace, 4"
        "$mainMod_SHIFT, Z, movetoworkspace, 5"
        "$mainMod_SHIFT, X, movetoworkspace, 6"
        "$mainMod_SHIFT, C, movetoworkspace, 7"
        "$mainMod_SHIFT, V, movetoworkspace, 8"
        "$mainMod_SHIFT, 9, movetoworkspace, 9"
        "$mainMod_SHIFT, 0, movetoworkspace, 10"
        "$mainMod, Q, togglespecialworkspace, magic"
        "$mainMod SHIFT, Q, movetoworkspace, special:magic"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
	];
   
      general = {
        "gaps_in" = "5";
        "gaps_out" = "5";
        "border_size" = "3";
        #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.active_border" = "rgb(${config.colorScheme.palette.base0A}) rgb(${config.colorScheme.palette.base09}) 45deg";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base05})";
        "allow_tearing" = "false";
        "layout" = "dwindle";
        "resize_on_border" = "true";
	"extend_border_grab_area" = "true";
      };

      decoration = {
        "rounding" = "10";
	"rounding_power" = "2";
	"active_opacity" = "1.0";
	"inactive_opacity" = "1.0";
	"dim_inactive" = "true";

	  shadow = {
	    "enabled" = "true";
	    "range" = "4";
	    "render_power" = "3";
	    "color" = "3";
	  };



      blur = {
        enabled = "true";
	size = "3";
	passes = "1";
	vibrancy = "0.1696";
      };

      };

      animations = {
        bezier = [
	  "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
	  ];
	animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
	];
      };

        dwindle = {
          pseudotile = "true";
          preserve_split = "true";
      };

        master = {
          new_status = "master";
      };

        misc = {
          force_default_wallpaper = "-1";
          disable_hyprland_logo = "false";
      };


      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = "1";
        sensitivity = "0 # -1.0 - 1.0, 0 means no modification.";

        touchpad = {
          natural_scroll = "false";
        };
      };

      gestures = {
        workspace_swipe = "false";
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };


      windowrule = [
        "float,class:^(alacritty)$,title:^(alacritty)$"
	"suppressevent maximize, class:.*"
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      exec-once = [
       "nm-applet --indicator &" 
       "waybar & dunst"
       "keepassxc"
       "systemctl --user start hyprpolkitagent"
       "${pkgs.swww}/bin/swww-daemon"
       "exec-once = tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE \"$HYPRLAND_INSTANCE_SIGNATURE\""
      ];
     
     
       env = [
         "XCURSOR_SIZE,24"
         "HYPRCURSOR_SIZE,24"
       ];



    };

  };
}
