{ config, pkgs, lib, ... }:
let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-empty-string = {
    Value = "";
    Status = "locked";
  };
in {
  programs.firefox = {
    enable = true;
    profiles.New-Main.extensions.force = true;
    #enableGnomeExtensions = true;

    policies = {
      DisableTelemetry = lib.mkForce true;
      DisableFirefoxStudies = lib.mkForce  true;
      DontCheckDefaultBrowser = lib.mkForce  true;
      DisablePocket = lib.mkForce true;
      SearchBar = "unified";

      Preferences = {
        # Privacy settings
        "extensions.autoDisableScopes" = 0;
        "extensions.pocket.enabled" = lock-false;
        "browser.newtabpage.pinned" = lock-empty-string;
        "browser.topsites.contile.enabled" = lock-false;
        "browser.newtabpage.activity-stream.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = lock-false;	
	"network.proxy.http" = "127.0.0.1";
	"network.proxy.http_port" = 8118;
	"network.proxy.type" = 1;
	"network.proxy.share_proxy_settings" = true;
        "browser.ml.chat.prompt.prefix" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.prompts.0" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.prompts.1" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.prompts.2" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.prompts.3" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.prompts.4" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.provider" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.shortcuts" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.shortcuts.custom" = "XXXXXXXXXXXXXXXX";
        "browser.ml.chat.shortcuts.longPress" = "XXXXXXXXXXXXXXXX";
	"browser.ml.chat.enabled" = lock-false;
	"browser.ml.chat.sidebar" = lock-false;
	"browser.ml.enable" = lib.mkForce false;
	"browser.ml.modelHubRootUrl" = lib.mkForce "https://goatse.cx";
	"browser.nativeMessagingHosts.packages" = [ pkgs.kdePackages.plasma-browser-integration pkgs.tridactyl-native ];
	"browser.layout.css.devPixelsPerPx" = "1";
	#For slow internet connection, force youtube to buffer the whole video.
	# This forces everything to 360p so not very useful
        "media.mediasource.enabled"=lib.mkForce true;
	"media.mediasource.mp4.enabled"=lib.mkForce true;
	"media.mediasource.experimental.enabled"=lib.mkForce true;
	"media.mediasource.vp9.enabled"=lib.mkForce true;
	"media.mediasource.webm.enabled"=lib.mkForce true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
       };
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
          };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
        "idcac-pub@guus.ninja" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
          installation_mode = "force_installed";
        };
        "enhancerforyoutube@maximerf.addons.mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/enhancer-for-youtube/latest.xpi";
          installation_mode = "force_installed";
        };
        "jid1-BoFifL9Vbdl2zQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
          installation_mode = "force_installed";
        };
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser/latest.xpi";
          installation_mode = "force_installed";
        };
        "FirefoxColor@mozilla.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefoxColor/latest.xpi";
          installation_mode = "force_installed";
        };
	"remove-login-with-google@RcCookie" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/remove-login-with-google/latest.xpi";
          installation_mode = "force_installed";
	};
	"plasma-browser-integration@kde.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-broweser-integration/latest.xpi";
          installation_mode = "force_installed";
	};
	"adb@mozilla.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/Firefox-DevTools-ADB-Extension/latest.xpi";
          installation_mode = "force_installed";
	};

	"gdpr@cavi.au.dk" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/Consent-O-Matic/latest.xpi";
          installation_mode = "force_installed";
	};
	"zotero@chnm.gmu.edu" = {
          install_url = "https://www.zotero.org/download/connector/dl?browser=firefox&version=5.0.176";
          installation_mode = "force_installed";
	};
	"jordanlinkwarden@gmail.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/Linkwarden/latest.xpi";
          installation_mode = "force_installed";
	};
	};
	######
        colors =  {
          bright = {
            black = "0x${config.colorScheme.palette.base00}";
            blue = "0x${config.colorScheme.palette.base04}";
            cyan = "0x${config.colorScheme.palette.base02}";
            green = "0x${config.colorScheme.palette.base06}";
            magenta = "0x${config.colorScheme.palette.base0E}";
            red = "0x${config.colorScheme.palette.base08}";
            white = "0x${config.colorScheme.palette.base07}";
            yellow = "0x${config.colorScheme.palette.base09}";
          };
          cursor = {
            cursor = "0x${config.colorScheme.palette.base06}";
            text = "0x${config.colorScheme.palette.base06}";
          };
          normal = {
            black = "0x${config.colorScheme.palette.base00}";
            blue = "0x${config.colorScheme.palette.base0D}";
            cyan = "0x${config.colorScheme.palette.base0C}";
            green = "0x${config.colorScheme.palette.base0B}";
            magenta = "0x${config.colorScheme.palette.base0E}";
            red = "0x${config.colorScheme.palette.base08}";
            white = "0x${config.colorScheme.palette.base06}";
            yellow = "0x${config.colorScheme.palette.base0A}";
          };
          primary = {
            background = "0x${config.colorScheme.palette.base00}";
            foreground = "0x${config.colorScheme.palette.base06}";
          };
	######

        userChrome = ''
  	  /* Show active colors on main menu bar */
          TabsToolbar,
            navigator-toolbox {
	      background: -moz-accent-color !important;
              color: black;
            }
            TabsToolbar:-moz-window-inactive,
            navigator-toolbox:-moz-window-inactive {
            background: unset !important;
            color: blue;
            }
	      :root {
                --tab-selected-bgcolor: #FFFFFF !important;
            }
	'';

        
      };
    };
};
}

