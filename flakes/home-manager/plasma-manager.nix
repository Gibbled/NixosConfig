{ pkgs, ... }:
{
  home.stateVersion = "23.11";

  programs.plasma = {
    enable = true;

    #
    # Some high-level settings:
    #
    workspace = {
      clickItemTo = "open"; # If you liked the click-to-open default from plasma 5
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 32;
      };
      iconTheme = "Papirus-Dark";
      #wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
      #wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Nuvole/contents/images/1080x1920.png";
    };


    fonts = {
      general = {
        family = "Hack";
        pointSize = 12;
      };
    };

    #desktop.widgets = [
      #{
        #plasmusicToolbar = {
          #position = {
            #horizontal = 51;
            #vertical = 100;
          #};
          #size = {
            #width = 250;
            #height = 250;
          #};
        #};
      #}
    #];

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
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
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
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
                "applications:org.kde.konsole.desktop"
              ];
            };
          }
          # Or you can do it manually, for example:
          # If no configuration is needed, specifying only the name of the
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
                "org.kde.plasma.volume"
                "org.kde.plasma.networkmanagement"
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
      # Application name, Global menu and Song information and playback controls at the top
    ];

    window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = {
            value = "dolphin";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
          # `apply` defaults to "apply-initially"
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 1000;
        };
        turnOffDisplay = {
          idleTimeout = 1000;
          idleTimeoutWhenLocked = "immediately";
        };
      };
      battery = {
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };

    kwin = {
      edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1
      cornerBarrier = false;

      #scripts.polonium.enable = true;
    };

    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };

    #
    # Some mid-level settings:
    #

    shortcuts = {
      "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
      "kmix"."decrease_volume" = "Volume Down";
      "kmix"."decrease_volume_small" = "Shift+Volume Down";
      "kmix"."increase_microphone_volume" = "Microphone Volume Up";
      "kmix"."increase_volume" = "Volume Up";
      "kmix"."increase_volume_small" = "Shift+Volume Up";
      "kmix"."mic_mute" = ["Microphone Mute,Microphone Mute" "Meta+Volume Mute,Mute Microphone"];
      "kmix"."mute" = "Volume Mute";
      "ksmserver"."Halt Without Confirmation" = "Ctrl+Alt+Shift+PgDown,,Shut Down Without Confirmation";
      "ksmserver"."Lock Session" = ["Screensaver" "Alt+Shift+L" "Screensaver,Lock Session"];
      "ksmserver"."Log Out" = "Ctrl+Alt+Del";
      "ksmserver"."Log Out Without Confirmation" = "Ctrl+Alt+Shift+Del,,Log Out Without Confirmation";
      "ksmserver"."LogOut" = [ ];
      "ksmserver"."Reboot" = [ ];
      "ksmserver"."Reboot Without Confirmation" = "Ctrl+Alt+Shift+PgUp,,Reboot Without Confirmation";
      "ksmserver"."Shut Down" = [ ];
      "kwin"."Activate Window Demanding Attention" = "Ctrl+Alt+A,Meta+Ctrl+A,Activate Window Demanding Attention";
      "kwin"."Cycle Overview" = ",none,Cycle through Overview and Grid View";
      "kwin"."Cycle Overview Opposite" = ",none,Cycle through Grid View and Overview";
      "kwin"."Decrease Opacity" = [ ];
      "kwin"."Expose" = "Ctrl+F9";
      "kwin"."ExposeAll" = ["Ctrl+F10" "Launch (C),Ctrl+F10" "Launch (C),Toggle Present Windows (All desktops)"];
      "kwin"."ExposeClass" = "Ctrl+F7";
      "kwin"."ExposeClassCurrentDesktop" = ",none,Toggle Present Windows (Window class on current desktop)";
      "kwin"."Grid View" = "Ctrl+Alt+G";
      "kwin"."Increase Opacity" = [ ];
      "kwin"."Kill Window" = "Ctrl+Alt+Esc,Meta+Ctrl+Esc,Kill Window";
      "kwin"."Move Tablet to Next Output" = ",none,Move the tablet to the next output";
      "kwin"."MoveMouseToCenter" = "Meta+F6";
      "kwin"."MoveMouseToFocus" = "Meta+F5";
      "kwin"."MoveZoomDown" = ",none,Move Zoomed Area Downwards";
      "kwin"."MoveZoomLeft" = ",none,Move Zoomed Area to Left";
      "kwin"."MoveZoomRight" = ",none,Move Zoomed Area to Right";
      "kwin"."MoveZoomUp" = ",none,Move Zoomed Area Upwards";
      "kwin"."Overview" = "Meta+W";
      "kwin"."Setup Window Shortcut" = [ ];
      "kwin"."Show Desktop" = ",Meta+D,Peek at Desktop";
      "kwin"."Switch One Desktop Down" = "Ctrl+Shift+Down,Meta+Ctrl+Down,Switch One Desktop Down";
      "kwin"."Switch One Desktop Up" = "Ctrl+Shift+Up,Meta+Ctrl+Up,Switch One Desktop Up";
      "kwin"."Switch One Desktop to the Right" = "Ctrl+Shift+Right,Meta+Ctrl+Right,Switch One Desktop to the Right";
      "kwin"."Switch Window Down" = "Meta+Alt+Down";
      "kwin"."Switch Window Left" = "Meta+Alt+Left";
      "kwin"."Switch Window Right" = "Meta+Alt+Right";
      "kwin"."Switch Window Up" = "Meta+Alt+Up";
      "kwin"."Switch to Desktop 1" = "Ctrl+F1";
      "kwin"."Switch to Desktop 10" = [ ];
      "kwin"."Switch to Desktop 11" = [ ];
      "kwin"."Switch to Desktop 12" = [ ];
      "kwin"."Switch to Desktop 13" = [ ];
      "kwin"."Switch to Desktop 14" = [ ];
      "kwin"."Switch to Desktop 15" = [ ];
      "kwin"."Switch to Desktop 16" = [ ];
      "kwin"."Switch to Desktop 17" = [ ];
      "kwin"."Switch to Desktop 18" = [ ];
      "kwin"."Switch to Desktop 19" = [ ];
      "kwin"."Switch to Desktop 2" = "Ctrl+F2";
      "kwin"."Switch to Desktop 20" = [ ];
      "kwin"."Switch to Desktop 3" = "Ctrl+F3";
      "kwin"."Switch to Desktop 4" = "Ctrl+F4";
      "kwin"."Switch to Desktop 5" = [ ];
      "kwin"."Switch to Desktop 6" = [ ];
      "kwin"."Switch to Desktop 7" = [ ];
      "kwin"."Switch to Desktop 8" = [ ];
      "kwin"."Switch to Desktop 9" = [ ];
      "kwin"."Switch to Next Desktop" = [ ];
      "kwin"."Switch to Next Screen" = [ ];
      "kwin"."Switch to Previous Desktop" = [ ];
      "kwin"."Switch to Previous Screen" = [ ];
      "kwin"."Switch to Screen 0" = [ ];
      "kwin"."Switch to Screen 1" = [ ];
      "kwin"."Switch to Screen 2" = [ ];
      "kwin"."Switch to Screen 3" = [ ];
      "kwin"."Switch to Screen 4" = [ ];
      "kwin"."Switch to Screen 5" = [ ];
      "kwin"."Switch to Screen 6" = [ ];
      "kwin"."Switch to Screen 7" = [ ];
      "kwin"."Switch to Screen Above" = [ ];
      "kwin"."Switch to Screen Below" = [ ];
      "kwin"."Switch to Screen to the Left" = [ ];
      "kwin"."Switch to Screen to the Right" = [ ];
      "kwin"."Toggle Night Color" = ",none,Suspend/Resume Night Light";
      "kwin"."Toggle Window Raise/Lower" = [ ];
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Backtab,Alt+Shift+Tab,Walk Through Windows (Reverse)";
      "kwin"."Walk Through Windows Alternative" = [ ];
      "kwin"."Walk Through Windows Alternative (Reverse)" = [ ];
      "kwin"."Walk Through Windows of Current Application" = "Alt+`";
      "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
      "kwin"."Walk Through Windows of Current Application Alternative" = [ ];
      "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
      "kwin"."Window Above Other Windows" = [ ];
      "kwin"."Window Below Other Windows" = [ ];
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Fullscreen" = [ ];
      "kwin"."Window Grow Horizontal" = [ ];
      "kwin"."Window Grow Vertical" = [ ];
      "kwin"."Window Lower" = [ ];
      "kwin"."Window Maximize" = "Ctrl+Alt+I,Meta+PgUp,Maximize Window";
      "kwin"."Window Maximize Horizontal" = [ ];
      "kwin"."Window Maximize Vertical" = [ ];
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window Move" = [ ];
      "kwin"."Window Move Center" = [ ];
      "kwin"."Window No Border" = [ ];
      "kwin"."Window On All Desktops" = [ ];
      "kwin"."Window One Desktop Down" = ",Meta+Ctrl+Shift+Down,Window One Desktop Down";
      "kwin"."Window One Desktop Up" = ",Meta+Ctrl+Shift+Up,Window One Desktop Up";
      "kwin"."Window One Screen Down" = [ ];
      "kwin"."Window One Screen Up" = [ ];
      "kwin"."Window One Screen to the Left" = [ ];
      "kwin"."Window One Screen to the Right" = [ ];
      "kwin"."Window Operations Menu" = "Alt+F3";
      "kwin"."Window Pack Down" = [ ];
      "kwin"."Window Pack Left" = [ ];
      "kwin"."Window Pack Right" = [ ];
      "kwin"."Window Pack Up" = [ ];
      "kwin"."Window Quick Tile Bottom" = "Ctrl+Alt+J,Meta+Down,Quick Tile Window to the Bottom";
      "kwin"."Window Quick Tile Bottom Left" = "Ctrl+Alt+M,,Quick Tile Window to the Bottom Left";
      "kwin"."Window Quick Tile Bottom Right" = "Ctrl+Alt+.,,Quick Tile Window to the Bottom Right";
      "kwin"."Window Quick Tile Left" = "Ctrl+Alt+H,Meta+Left,Quick Tile Window to the Left";
      "kwin"."Window Quick Tile Right" = "Ctrl+Alt+L,Meta+Right,Quick Tile Window to the Right";
      "kwin"."Window Quick Tile Top" = "Ctrl+Alt+K,Meta+Up,Quick Tile Window to the Top";
      "kwin"."Window Quick Tile Top Left" = "Ctrl+Alt+U,,Quick Tile Window to the Top Left";
      "kwin"."Window Quick Tile Top Right" = "Ctrl+Alt+O,,Quick Tile Window to the Top Right";
      "kwin"."Window Raise" = [ ];
      "kwin"."Window Resize" = [ ];
      "kwin"."Window Shade" = [ ];
      "kwin"."Window Shrink Horizontal" = [ ];
      "kwin"."Window Shrink Vertical" = [ ];
      "kwin"."Window to Desktop 1" = [ ];
      "kwin"."Window to Desktop 10" = [ ];
      "kwin"."Window to Desktop 11" = [ ];
      "kwin"."Window to Desktop 12" = [ ];
      "kwin"."Window to Desktop 13" = [ ];
      "kwin"."Window to Desktop 14" = [ ];
      "kwin"."Window to Desktop 15" = [ ];
      "kwin"."Window to Desktop 16" = [ ];
      "kwin"."Window to Desktop 17" = [ ];
      "kwin"."Window to Desktop 18" = [ ];
      "kwin"."Window to Desktop 19" = [ ];
      "kwin"."Window to Desktop 2" = [ ];
      "kwin"."Window to Desktop 20" = [ ];
      "kwin"."Window to Desktop 3" = [ ];
      "kwin"."Window to Desktop 4" = [ ];
      "kwin"."Window to Desktop 5" = [ ];
      "kwin"."Window to Desktop 6" = [ ];
      "kwin"."Window to Desktop 7" = [ ];
      "kwin"."Window to Desktop 8" = [ ];
      "kwin"."Window to Desktop 9" = [ ];
      "kwin"."Window to Next Desktop" = [ ];
      "kwin"."Window to Next Screen" = ",Meta+Shift+Right,Move Window to Next Screen";
      "kwin"."Window to Previous Desktop" = [ ];
      "kwin"."Window to Previous Screen" = ",Meta+Shift+Left,Move Window to Previous Screen";
      "kwin"."Window to Screen 0" = [ ];
      "kwin"."Window to Screen 1" = [ ];
      "kwin"."Window to Screen 2" = [ ];
      "kwin"."Window to Screen 3" = [ ];
      "kwin"."Window to Screen 4" = [ ];
      "kwin"."Window to Screen 5" = [ ];
      "kwin"."Window to Screen 6" = [ ];
      "kwin"."Window to Screen 7" = [ ];
      "kwin"."disableInputCapture" = "Meta+Shift+Esc";
      "kwin"."view_actual_size" = ",Meta+0,Zoom to Actual Size";
      "kwin"."view_zoom_in" = ["Ctrl+Alt+=,Meta++" "Meta+=,Zoom In"];
      "kwin"."view_zoom_out" = "Ctrl+Alt+-,Meta+-,Zoom Out";
      "mediacontrol"."mediavolumedown" = [ ];
      "mediacontrol"."mediavolumeup" = [ ];
      "mediacontrol"."nextmedia" = "Media Next";
      "mediacontrol"."pausemedia" = "Media Pause";
      "mediacontrol"."playmedia" = [ ];
      "mediacontrol"."playpausemedia" = "Media Play";
      "mediacontrol"."previousmedia" = "Media Previous";
      "mediacontrol"."stopmedia" = "Media Stop";
      "org_kde_powerdevil"."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness" = "Monitor Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      "org_kde_powerdevil"."Hibernate" = "Hibernate";
      "org_kde_powerdevil"."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness" = "Monitor Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      "org_kde_powerdevil"."PowerDown" = "Power Down";
      "org_kde_powerdevil"."PowerOff" = "Power Off";
      "org_kde_powerdevil"."Sleep" = "Sleep";
      "org_kde_powerdevil"."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      "org_kde_powerdevil"."Turn Off Screen" = ",none,Turn Off Screen";
      "org_kde_powerdevil"."powerProfile" = ["Battery" "Meta+B,Battery" "Meta+B,Switch Power Profile"];
      "plasmashell"."activate application launcher" = [",Meta" "Alt+F1,Activate Application Launcher"];
      "plasmashell"."activate task manager entry 1" = "Meta+1";
      "plasmashell"."activate task manager entry 10" = [ ];
      "plasmashell"."activate task manager entry 2" = ",Meta+2,Activate Task Manager Entry 2";
      "plasmashell"."activate task manager entry 3" = ",Meta+3,Activate Task Manager Entry 3";
      "plasmashell"."activate task manager entry 4" = ",Meta+4,Activate Task Manager Entry 4";
      "plasmashell"."activate task manager entry 5" = ",Meta+5,Activate Task Manager Entry 5";
      "plasmashell"."activate task manager entry 6" = ",Meta+6,Activate Task Manager Entry 6";
      "plasmashell"."activate task manager entry 7" = ",Meta+7,Activate Task Manager Entry 7";
      "plasmashell"."activate task manager entry 8" = ",Meta+8,Activate Task Manager Entry 8";
      "plasmashell"."activate task manager entry 9" = ",Meta+9,Activate Task Manager Entry 9";
      "plasmashell"."clear-history" = "Ctrl+Alt+C,,Clear Clipboard History";
      "plasmashell"."clipboard_action" = "Ctrl+Alt+X,Meta+Ctrl+X,Automatic Action Popup Menu";
      "plasmashell"."cycle-panels" = "Meta+Alt+P";
      "plasmashell"."cycleNextAction" = [ ];
      "plasmashell"."cyclePrevAction" = [ ];
      "plasmashell"."manage activities" = ",Meta+Q,Show Activity Switcher";
      "plasmashell"."next activity" = ",none,Walk through activities";
      "plasmashell"."previous activity" = ",none,Walk through activities (Reverse)";
      "plasmashell"."repeat_action" = [ ];
      "plasmashell"."show dashboard" = "Ctrl+F12";
      "plasmashell"."show-barcode" = [ ];
      "plasmashell"."show-on-mouse-pos" = ",Meta+V,Show Clipboard Items at Mouse Position";
      "plasmashell"."stop current activity" = ",Meta+S,Stop Current Activity";
      "plasmashell"."switch to next activity" = [ ];
      "plasmashell"."switch to previous activity" = [ ];
      "plasmashell"."toggle do not disturb" = [ ];
      "services/firefox.desktop"."_launch" = "Ctrl+Alt+R";
      "services/kitty.desktop"."_launch" = "Ctrl+Alt+T";
      "services/org.kde.konsole.desktop"."_launch" = [ ];
      "services/org.kde.plasma-systemmonitor.desktop"."_launch" = [ ];
      "services/systemsettings.desktop"."kcm-kscreen" = [ ];
      "services/systemsettings.desktop"."kcm-lookandfeel" = [ ];
      "services/systemsettings.desktop"."kcm-powerdevilprofilesconfig" = [ ];
      "services/systemsettings.desktop"."kcm-screenlocker" = [ ];
      "services/systemsettings.desktop"."kcm-users" = [ ];
    };
    #
    # Some low-level settings:
    #
    configFile = {

      "baloofilerc"."General"."dbVersion" = 2;
      "baloofilerc"."General"."exclude filters" = "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
      "baloofilerc"."General"."exclude filters version" = 9;
      "dolphinrc"."General"."ViewPropsTimestamp" = "2025,2,4,12,43,52.321";
      "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
      "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
      "kactivitymanagerdrc"."activities"."be924cdb-b275-4dbd-bca6-283d79b9d7fc" = "Default";
      "kactivitymanagerdrc"."main"."currentActivity" = "be924cdb-b275-4dbd-bca6-283d79b9d7fc";
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "820,584";
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
      "kiorc"."Confirmations"."ConfirmDelete" = true;
      "kscreenlockerrc"."Daemon"."Autolock" = false;
      "ksmserverrc"."General"."confirmLogout" = false;
      "ksmserverrc"."General"."loginMode" = "emptySession";
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Activities/LastVirtualDesktop"."be924cdb-b275-4dbd-bca6-283d79b9d7fc" = "f24e2cda-564a-49f9-943d-63fb3a8a8d17";
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling/053156a2-406e-56a4-a32c-6d76a508f28b"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/18d05852-165c-5e9f-827b-8b035a8ef61f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/39d1c291-5bab-5ba3-a9a5-8ad32f048f9a"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/48bee780-bf9b-572e-ac54-6f03a9c2b485"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/4e46e4de-7fa2-50cf-b2e7-d7e35fd24964"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/564d66de-5484-5a0d-b866-00119fc39ad6"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/6d97aa7f-59be-549b-b309-d91b9fd3434f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/7e100540-d33e-5cf7-81bd-1fba161bd939"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/91803c51-51ce-5190-b57b-c50afefd18a6"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/92e842d7-5928-5c43-884a-4912e7cc82ed"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/af06ddb0-1582-50ec-956a-310bff30ab9f"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Tiling/d0ee5a5c-6a17-5dd9-b898-5ca97de21ca0"."tiles" = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
      "kwinrc"."Xwayland"."Scale" = 2;
      "plasma-localerc"."Formats"."LANG" = "en_GB.UTF-8";
      "plasma-localerc"."Translations"."LANGUAGE" = "en_US";
      kwinrc.Desktops.Number = {
        value = 8;
        # Forces kde to not change this value (even through the settings app).
        immutable = true;
      };
      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        # To use nested groups use / as a separator. In the below example,
        # Provider will be added to [Greeter][Wallpaper][org.kde.potd][General].
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
    };
  };
}
