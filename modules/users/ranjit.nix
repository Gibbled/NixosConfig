{config, pkgs, lib, systemSettings, userSettings, ... }:
{

  users.users.ranjit = {

  isNormalUser = true;
  #hashedPasswordFile = config.sops-secrets.ranjit-password.path;
  description = "Ranjit";
  uid = 1001;
  extraGroups = [ "networkmanager" "wheel" "docker" "video" "lp" "dialout" "tor"  "kvm" "libvirt" "usb" "input" "lpadmin" "plugdev" "pcap" "pipewire" "sddm" "crontab" "wireshark" ];
  openssh.authorizedKeys.keys = [ "ssh-rsa·AAAAB3NzaC1yc2EAAAADAQABAAABAQCoGqlfV2v8FjFAZJLJMhcxaNdriHUY0MffQCsxH2wIn6hi      WmxbS/5vWjPyaZs7YJ/ssCywHNnlVD8dZnutboeOjfUtv7VBsUF/c5RX8vASv3fMFSbQ4ZEzbr5m8gd7LFdkyaoBSlN1ePwqDk0wxcleD4ZINKHcaOSJgyGFX      t12zRHmGxOrEyamgotqt3oLQHGmTnqj3MQh57Se1raVV1jzvFxTephOL3C0inh/DMaEIc8/YXvXj4t5lwuxj/LNYa8QCNcbxD0d9+E+SXN7TaUyZnC5OSlQBw      RjA+uqrev6pfpu3FV2u8T/DUJ/UPSlFn0Y3zGnETCWjkp29K2Iptzh·openpgp:0x8FA972DE" "ssh-rsa·AAAAB3NzaC1yc2EAAAADAQABAAABAQCoGqlfV      2v8FjFAZJLJMhcxaNdriHUY0MffQCsxH2wIn6hiWmxbS/5vWjPyaZs7YJ/ssCywHNnlVD8dZnutboeOjfUtv7VBsUF/c5RX8vASv3fMFSbQ4ZEzbr5m8gd7LF      dkyaoBSlN1ePwqDk0wxcleD4ZINKHcaOSJgyGFXt12zRHmGxOrEyamgotqt3oLQHGmTnqj3MQh57Se1raVV1jzvFxTephOL3C0inh/DMaEIc8/YXvXj4t5lwu      xj/LNYa8QCNcbxD0d9+E+SXN7TaUyZnC5OSlQBwRjA+uqrev6pfpu3FV2u8T/DUJ/UPSlFn0Y3zGnETCWjkp29K2Iptzh·cardno:000604872437" "ssh-r      sa·AAAAB3NzaC1yc2EAAAADAQABAAABgQDQ8Azg+ZQQZroD9EqNJuX+cXG7OHciySliqCxp1B5nCXj5XrZoe/57hR3FoieQ4fi2KlfQk4UXWIiEQceOZ1kbqf      0DWNznZ+1Ft1/+qdeq6rsU0NYpeuRZYr8XAiitT2FaMWsVC5eRewjuzpHm0mUjq3bBuRGSmutR9wHpshQ7FrE9Gv13ZyIqRzAzQ2Klos+jR1SvEZhpxJdt4wx      XWkCQPlDPYToXqfdIWgneA/juygxA8uxpYHzaSqVfedCudQ+l6HYR96ASYOWHNj666txk+YJ0gdjH2grqlvINC6rQhA7JRjbRTfAdFi0dLw8o7+lUtiTwx+Pt      m9OXR2PtJVSt3gc+OBk5NeUs6dCb+W9N0Dyy++M89ASlYfRU/K5x8lUBMyif1fMX/zfT0/bVBrYVOpccUiKvOwPbqz70FSPugyrrC8pQcCA/O15fJV+p15MID      NMtFDQII5P910jvNUeVLRtE/A7gW34GmgLJ9s9yTkWNEaRtayrp1gP6+RII1Ak=·ranjit@jukebox" ];
  packages = with pkgs; [
  #This is handled by home-manager for the moment

  ];
  };
  }
