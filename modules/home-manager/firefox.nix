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

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
      DisablePocket = true;
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
        "browser.ml.chat.prompt.prefix" = "fuck you Mozilla";
        "browser.ml.chat.prompts.0" = "fuck you Mozilla";
        "browser.ml.chat.prompts.1" = "fuck you Mozilla";
        "browser.ml.chat.prompts.2" = "fuck you Mozilla";
        "browser.ml.chat.prompts.3" = "fuck you Mozilla";
        "browser.ml.chat.prompts.4" = "fuck you Mozilla";
        "browser.ml.chat.provider" = "fuck you Mozilla";
        "browser.ml.chat.shortcuts" = "fuck you Mozilla";
        "browser.ml.chat.shortcuts.custom" = "fuck you Mozilla";
        "browser.ml.chat.shortcuts.longPress" = "fuck you Mozilla";
	"browser.ml.chat.enabled" = lock-false;
	"browser.ml.chat.sidebar" = lock-false;
	"browser.ml.enable" = lib.mkForce false;
	"browser.ml.modelHubRootUrl" = lib.mkForce "Gibbledy Gook";
	"browser.nativeMessagingHosts.packages" = [ pkgs.kdePackages.plasma-browser-integration pkgs.tridactyl-native ];
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
        "{884679b9-5d6b-48b2-90a7-15ae26ce568a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/watch-on-odysee/latest.xpi";
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
      };
    };
};
}

