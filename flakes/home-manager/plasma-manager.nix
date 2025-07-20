{
  programs.plasma = {
    enable = true;
    
    fonts = {
      general = {
        family = "Hack";
        pointSize = 18;
      };
    };


    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
	lengthMode = "fit";
        widgets = [
          # We can configure the widgets by adding the name and config
          # attributes. For example to add the the kickoff widget and set the
          # icon to "nix-snowflake-white" use the below configuration. This will
          # add the "icon" key to the "General" group for the widget in
          # ~/.config/plasma-org.kde.plasma.desktop-appletsrc.
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-rainbow";
                alphaSort = true;
              };
            };
          }

	  {
	    name = "org.kde.plasma.pager";
	    config  = {};


	  }
          # Or you can configure the widgets by adding the widget-specific options for it.
          # See modules/widgets for supported widgets and options for these widgets.
          # For example:
          # Adding configuration to the widgets can also for example be used to
          # pin apps to the task-manager, which this example illustrates by
          # pinning dolphin and konsole to the task-manager by default with widget-specific options.
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:alacritty.desktop"
                "applications:firefox.desktop"
                "applications:OrcaSlicer.desktop"
                "applications:virt-manager.desktop"
                "applications:blender.desktop"
              ];
            };
          }
          # Or you can do it manually, for example:
          # widget will add them with the default configuration.
          "org.kde.plasma.marginsseparator"
          # If you need configuration for your widget, instead of specifying the
          # the keys and values directly using the config attribute as shown
          # above, plasma-manager also provides some higher-level interfaces for
          # configuring the widgets. See modules/widgets for supported widgets
          # and options for these widgets. The widgets below shows two examples
          # of usage, one where we add a digital clock, setting 12h time and
          # first day of the week to Sunday and another adding a systray with
          # some modifications in which entries to show.
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "12h";
            };
          }
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.battery"
              ];
            };
          }
        ];
        hiding = "autohide";
      }
    ];

     hotkeys.commands."alacritty" = {
         name = "Launch Alacritty";
         key = "Ctrl+Alt+T";
         command = "alacritty";
        };

     hotkeys.commands."blender" = {
       name = "Launch Blender";
       key = "Ctrl+Alt+E";
       command = "blender";
     };

     hotkeys.commands."Virt-Manager" = {
       name = "Launch Virtual Machine Manager";
       key = "Ctrl+Alt+W";
       command = "virt-manager";
     };

     hotkeys.commands."firefox" = {
       name = "Launch Firefox";
       key = "Ctrl+Alt+R";
       command = "firefox";
     };

    shortcuts = {
      #"services.virt-manager.desktop"."_launch" = "Ctrl+Alt+W";
      #"services.blender.desktop"."_launch" = "Ctrl+Alt+E";
      #"services.firefox.desktop"."_launch" = "Ctrl+Alt+R";
      #"services.alacritty.desktop"."_launch" = "Ctrl+Alt+T";
      "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
      "kmix"."decrease_volume" = "Volume Down";
      "kmix"."decrease_volume_small" = "Shift+Volume Down";
      "kmix"."increase_microphone_volume" = "Microphone Volume Up";
      "kmix"."increase_volume" = "Volume Up";
      "kmix"."increase_volume_small" = "Shift+Volume Up";
      "kmix"."mic_mute" = ["Microphone Mute,Microphone Mute" "Meta+Volume Mute,Mute Microphone"];
      "kmix"."mute" = "Volume Mute";
      "kwin"."Switch to Desktop 1" = "Ctrl+F1";
      "kwin"."Switch to Desktop 2" = "Ctrl+F2";
      "kwin"."Switch to Desktop 3" = "Ctrl+F3";
      "kwin"."Switch to Desktop 4" = "Ctrl+F4";
      "kwin"."Switch to Desktop 5" = "Ctrl+F5";
      "kwin"."Switch to Desktop 6" = "Ctrl+F6";
      "kwin"."Switch to Desktop 7" = "Ctrl+F7";
      "kwin"."Switch to Desktop 8" = "Ctrl+F8";
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Quick Tile Top" = "Ctrl+Alt+K";
      "kwin"."Window Quick Tile Top Left" = "Ctrl+Alt+U";
      "kwin"."Window Quick Tile Top Right" = "Ctrl+Alt+O";
      "mediacontrol"."nextmedia" = "Media Next";
      "mediacontrol"."pausemedia" = "Media Pause";
      "mediacontrol"."playpausemedia" = "Media Play";
      "mediacontrol"."previousmedia" = "Media Previous";
      "mediacontrol"."stopmedia" = "Media Stop";
      "plasmashell"."show dashboard" = "Ctrl+F12";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false;
      "baloofilerc"."General"."dbVersion" = 2;
      "baloofilerc"."General"."exclude filters" = "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
      "baloofilerc"."General"."exclude filters version" = 9;
      kwinrc.Desktops.Number = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
      "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
      "kactivitymanagerdrc"."activities"."be924cdb-b275-4dbd-bca6-283d79b9d7fc" = "Default";
      "kactivitymanagerdrc"."main"."currentActivity" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "kcminputrc"."Mouse"."cursorSize" = 32;
      "kcminputrc"."Mouse"."cursorTheme" = "Bibata-Modern-Amber";
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "820,584";
      "kdeglobals"."General"."font" = "Hack,18,-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
      "kdeglobals"."KDE"."LookAndFeelPackage" = "org.kde.breezedark.desktop";
      "kdeglobals"."KDE"."SingleClick" = true;
      "kdeglobals"."KDE"."widgetStyle" = "kvantum-dark";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Preview" = false;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 140;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."KScreen"."ScreenScaleFactors" = "HDMI-A-2=1;";
      "kdeglobals"."KScreen"."XwaylandClientsScale" = false;
      "kdeglobals"."Shortcuts"."Clear" = "";
      "kdeglobals"."Shortcuts"."ConfigureNotifications" = "";
      "kdeglobals"."Shortcuts"."ConfigureToolbars" = "";
      "kdeglobals"."Shortcuts"."EditBookmarks" = "";
      "kdeglobals"."Shortcuts"."FitToHeight" = "";
      "kdeglobals"."Shortcuts"."FitToPage" = "";
      "kdeglobals"."Shortcuts"."FitToWidth" = "";
      "kdeglobals"."Shortcuts"."Goto" = "";
      "kdeglobals"."Shortcuts"."GotoPage" = "";
      "kdeglobals"."Shortcuts"."OpenRecent" = "";
      "kdeglobals"."Shortcuts"."PrintPreview" = "";
      "kdeglobals"."Shortcuts"."Revert" = "";
      "kdeglobals"."Shortcuts"."ShowStatusbar" = "";
      "kdeglobals"."Shortcuts"."ShowToolbar" = "";
      "kdeglobals"."Shortcuts"."Spelling" = "";
      "kdeglobals"."Shortcuts"."SwitchApplicationLanguage" = "";
      "kdeglobals"."Shortcuts"."Zoom" = "";
      "kdeglobals"."WM"."activeBackground" = "227,229,231";
      "kdeglobals"."WM"."activeBlend" = "227,229,231";
      "kdeglobals"."WM"."activeForeground" = "35,38,41";
      "kdeglobals"."WM"."inactiveBackground" = "239,240,241";
      "kdeglobals"."WM"."inactiveBlend" = "239,240,241";
      "kdeglobals"."WM"."inactiveForeground" = "112,125,138";
      "kglobalshortcutsrc"."ActivityManager"."_k_friendly_name" = "Activity Manager";
      "kglobalshortcutsrc"."KDE Keyboard Layout Switcher"."_k_friendly_name" = "Keyboard Layout Switcher";
      "kglobalshortcutsrc"."kaccess"."_k_friendly_name" = "Accessibility";
      "kglobalshortcutsrc"."kcm_touchpad"."_k_friendly_name" = "Touchpad";
      "kglobalshortcutsrc"."kmix"."_k_friendly_name" = "Audio Volume";
      "kglobalshortcutsrc"."ksmserver"."_k_friendly_name" = "Session Management";
      "kglobalshortcutsrc"."kwin"."_k_friendly_name" = "KWin";
      "kglobalshortcutsrc"."mediacontrol"."_k_friendly_name" = "Media Controller";
      "kglobalshortcutsrc"."org_kde_powerdevil"."_k_friendly_name" = "Power Management";
      "kglobalshortcutsrc"."plasmashell"."_k_friendly_name" = "plasmashell";
      "kiorc"."Confirmations"."ConfirmDelete" = true;
      "kscreenlockerrc"."Daemon"."Autolock" = false;
      "kscreenlockerrc"."Daemon"."LockOnResume" = true;
      "kscreenlockerrc"."Daemon"."Timeout" = 10;
      "kscreenlockerrc"."Greeter"."WallpaperPlugin" = "org.kde.potd";
      "kscreenlockerrc"."Greeter.Wallpaper.org.kde.potd.General"."Provider" = "bing";
      "ksmserverrc"."General"."confirmLogout" = false;
      "ksmserverrc"."General"."loginMode" = "emptySession";
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Activities.LastVirtualDesktop"."be924cdb-b275-4dbd-bca6-283d79b9d7fc" = "f24e2cda-564a-49f9-943d-63fb3a8a8d17";
      "kwinrc"."Compositing"."AllowTearing" = false;
      "kwinrc"."Desktops"."Id_1" = "690f163a-1c02-453b-9a2f-c830e4a13c33";
      "kwinrc"."Desktops"."Id_2" = "b674c2c7-d4d5-415b-bd9e-83ca09798e4f";
      "kwinrc"."Desktops"."Id_3" = "f24e2cda-564a-49f9-943d-63fb3a8a8d17";
      "kwinrc"."Desktops"."Id_4" = "5cfa62ee-7136-4e11-bb38-6ea077b6a08d";
      "kwinrc"."Desktops"."Id_5" = "41b0d4a3-f74b-403e-8d18-3545cd3e6358";
      "kwinrc"."Desktops"."Id_6" = "e2eb8364-1ab5-49e8-b3a0-66f34edb259e";
      "kwinrc"."Desktops"."Id_7" = "8587182b-808c-445b-8c73-a32ee5a75db2";
      "kwinrc"."Desktops"."Id_8" = "9912ef68-8818-48e6-a46d-c8a40b50ccdf";
      "kwinrc"."Desktops"."Name_1" = "Desktop 1";
      "kwinrc"."Desktops"."Name_2" = "Desktop 2";
      "kwinrc"."Desktops"."Name_3" = "Desktop 3";
      "kwinrc"."Desktops"."Name_4" = "Desktop 4";
      "kwinrc"."Desktops"."Name_5" = "Desktop 5";
      "kwinrc"."Desktops"."Name_6" = "Desktop 6";
      "kwinrc"."Desktops"."Name_7" = "Desktop 7";
      "kwinrc"."Desktops"."Name_8" = "Desktop 8";
      "kwinrc"."Desktops"."Number[$i]" = 8;
      "kwinrc"."Desktops"."Rows" = 2;
      "kwinrc"."EdgeBarrier"."CornerBarrier" = false;
      "kwinrc"."EdgeBarrier"."EdgeBarrier" = 0;
      "kwinrc"."Effect-overview"."BorderActivate" = 9;
      "kwinrc"."NightColor"."Active" = true;
      "kwinrc"."NightColor"."LatitudeFixed" = 51.42742127862595;
      "kwinrc"."NightColor"."LongitudeFixed" = 3.9385573308270523;
      "kwinrc"."NightColor"."Mode" = "Location";
      "kwinrc"."Plugins"."poloniumEnabled" = true;
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling.053156a2-406e-56a4-a32c-6d76a508f28b"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.18d05852-165c-5e9f-827b-8b035a8ef61f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.39d1c291-5bab-5ba3-a9a5-8ad32f048f9a"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.48bee780-bf9b-572e-ac54-6f03a9c2b485"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.4e46e4de-7fa2-50cf-b2e7-d7e35fd24964"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.564d66de-5484-5a0d-b866-00119fc39ad6"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.6d97aa7f-59be-549b-b309-d91b9fd3434f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.7e100540-d33e-5cf7-81bd-1fba161bd939"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.91803c51-51ce-5190-b57b-c50afefd18a6"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.92e842d7-5928-5c43-884a-4912e7cc82ed"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.af06ddb0-1582-50ec-956a-310bff30ab9f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Tiling.d0ee5a5c-6a17-5dd9-b898-5ca97de21ca0"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":\x5b{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}\x5d}";
      "kwinrc"."Xwayland"."Scale" = 2;
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."org.kde.kdecoration2"."theme" = "__aurorae__svg__Sweet-Dark-transparent";
      "kwinrulesrc"."1"."Description" = "Dolphin";
      "kwinrulesrc"."1"."maximizehoriz" = true;
      "kwinrulesrc"."1"."maximizehorizrule" = 3;
      "kwinrulesrc"."1"."maximizevert" = true;
      "kwinrulesrc"."1"."maximizevertrule" = 3;
      "kwinrulesrc"."1"."noborder" = true;
      "kwinrulesrc"."1"."noborderrule" = 2;
      "kwinrulesrc"."1"."types" = 1;
      "kwinrulesrc"."1"."wmclass" = "dolphin";
      "kwinrulesrc"."1"."wmclasscomplete" = true;
      "kwinrulesrc"."1"."wmclassmatch" = 2;
      "kwinrulesrc"."General"."count" = 1;
      "kwinrulesrc"."General"."rules" = 1;
      "plasma-localerc"."Formats"."LANG" = "en_GB.UTF-8";
      "plasma-localerc"."Translations"."LANGUAGE" = "en_US";
      "plasma-org.kde.plasma.desktop-appletsrc"."ActionPlugins.0"."MiddleButton;NoModifier" = "org.kde.paste";
      "plasma-org.kde.plasma.desktop-appletsrc"."ActionPlugins.0"."RightButton;NoModifier" = "org.kde.contextmenu";
      "plasma-org.kde.plasma.desktop-appletsrc"."ActionPlugins.1"."RightButton;NoModifier" = "org.kde.contextmenu";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."activityId" = "";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."formfactor" = 2;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."lastScreen" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."location" = 4;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."plugin" = "org.kde.panel";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112"."plugin" = "org.kde.plasma.kickoff";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration"."PreloadWeight" = 100;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration"."popupHeight" = 533;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration"."popupWidth" = 763;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration.General"."alphaSort" = true;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration.General"."favoritesPortedToKAstats" = true;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.112.Configuration.General"."icon" = "nix-snowflake-white";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.114"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.114"."plugin" = "org.kde.plasma.marginsseparator";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115"."plugin" = "org.kde.plasma.digitalclock";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration"."PreloadWeight" = 65;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration"."popupHeight" = 450;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration"."popupWidth" = 560;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration.Appearance"."autoFontAndSize" = true;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration.Appearance"."firstDayOfWeek" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.115.Configuration.Appearance"."use24hFormat" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.116"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.116"."plugin" = "org.kde.plasma.systemtray";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.116.Configuration"."PreloadWeight" = 60;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.116.Configuration"."SystrayContainmentId" = 117;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.136"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.Applets.136"."plugin" = "org.kde.plasma.pager";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.111.General"."AppletOrder" = "112;114;136;115;116";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."activityId" = "";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."formfactor" = 2;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."lastScreen" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."location" = 4;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."plugin" = "org.kde.plasma.private.systemtray";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."popupHeight" = 436;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."popupWidth" = 436;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.118"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.118"."plugin" = "org.kde.plasma.cameraindicator";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.119"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.119"."plugin" = "org.kde.plasma.manage-inputmethod";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.120"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.120"."plugin" = "org.kde.plasma.clipboard";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.121"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.121"."plugin" = "org.kde.plasma.devicenotifier";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.122"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.122"."plugin" = "org.kde.plasma.notifications";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.123"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.123"."plugin" = "org.kde.plasma.keyboardlayout";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.124"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.124"."plugin" = "org.kde.plasma.printmanager";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.125"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.125"."plugin" = "org.kde.plasma.volume";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.125.Configuration.General"."migrated" = true;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.126"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.126"."plugin" = "org.kde.plasma.keyboardindicator";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.127"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.127"."plugin" = "org.kde.kscreen";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.128"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.128"."plugin" = "org.kde.plasma.battery";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.128.Configuration"."PreloadWeight" = 18;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.129"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.129"."plugin" = "org.kde.plasma.brightness";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.129.Configuration"."PreloadWeight" = 18;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.130"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.130"."plugin" = "org.kde.plasma.networkmanagement";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.130.Configuration"."PreloadWeight" = 60;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.137"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.137"."plugin" = "org.kde.plasma.bluetooth";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.Applets.137.Configuration"."PreloadWeight" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.General"."extraItems" = "org.kde.plasma.cameraindicator,org.kde.plasma.manage-inputmethod,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.notifications,org.kde.plasma.mediacontroller,org.kde.plasma.keyboardlayout,org.kde.plasma.printmanager,org.kde.plasma.brightness,org.kde.plasma.battery,org.kde.plasma.volume,org.kde.plasma.keyboardindicator,org.kde.kscreen,org.kde.plasma.networkmanagement,org.kde.plasma.bluetooth";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.General"."hiddenItems" = "org.kde.plasma.battery";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.General"."knownItems" = "org.kde.plasma.cameraindicator,org.kde.plasma.manage-inputmethod,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.notifications,org.kde.plasma.mediacontroller,org.kde.plasma.keyboardlayout,org.kde.plasma.printmanager,org.kde.plasma.brightness,org.kde.plasma.battery,org.kde.plasma.volume,org.kde.plasma.keyboardindicator,org.kde.kscreen,org.kde.plasma.networkmanagement,org.kde.plasma.bluetooth";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.117.General"."shownItems" = "org.kde.plasma.bluetooth,org.kde.plasma.volume,org.kde.plasma.networkmanagement";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."ItemGeometries-1920x1080" = "";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."ItemGeometriesHorizontal" = "";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."activityId" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."formfactor" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."lastScreen" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."location" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."plugin" = "org.kde.plasma.folder";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21.General"."positions" = "{\"1920x1080\":[]}";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21.Wallpaper.org.kde.image.General"."Image" = "/home/ranjit/.local/share/wallpapers/Sweet-Wallpapers/Sweet-space.png";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.21.Wallpaper.org.kde.image.General"."SlidePaths" = "/home/ranjit/.local/share/wallpapers/,/nix/store/99ciqkd1fnd84dfdvs9qz7jy86sbb8yx-breeze-6.3.2/share/wallpapers/,/run/current-system/sw/share/wallpapers/";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."activityId" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."formfactor" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."lastScreen" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."location" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."plugin" = "org.kde.plasma.folder";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.22"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."activityId" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."formfactor" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."lastScreen" = 2;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."location" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."plugin" = "org.kde.plasma.folder";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.23"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."activityId" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."formfactor" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."immutability" = 1;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."lastScreen" = 3;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."location" = 0;
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."plugin" = "org.kde.plasma.folder";
      "plasma-org.kde.plasma.desktop-appletsrc"."Containments.24"."wallpaperplugin" = "org.kde.image";
      "plasma-org.kde.plasma.desktop-appletsrc"."ScreenMapping"."itemsOnDisabledScreens" = "";
      "plasmarc"."Theme"."name" = "Utterly-Round";
      "plasmarc"."Wallpapers"."usersWallpapers" = "";
    };
  };
}
