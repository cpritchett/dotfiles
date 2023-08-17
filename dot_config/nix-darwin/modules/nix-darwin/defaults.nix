{ config, pkgs, nix-vars, ... }: {
  # !Requirements for Nix/Nix-Darwin
  system.stateVersion = 4; # Backwards Compatability
  services.nix-daemon.enable = true; # Required by nix-darwin

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ]; # Add flakes to the default nix command
      auto-optimise-store = true; # Remove dupe files
    };
    gc = {
      automatic = true; # Auto run Garbage Collections
      interval = {
        Hour = 3;
        Minute = 15;
      }; # When to run garbage collection
    };
  };

  programs = {
    zsh.enable = true; # Lose important Nix Paths if disabled
    nix-index.enable = true;
  };

  users.users."${nix-vars.username}".home = "/Users/${nix-vars.username}"; # Avoid /var/empty warnings/errors  
  # macOS Defaults
  system.defaults = {
    dock = {
      autohide = false;
      autohide = false;
      minimize-to-application = true;
      mru-spaces = false;
      show-recents = true;
      show-recents = true;

      # Hot Corners
      # wvous-tl-corner = 2; # Mission Control
      # wvous-tr-corner = 12; # Notification Center
      # wvous-bl-corner = 14; # Quick Note
      # wvous-br-corner = 4; # Desktop
    };

    finder = {
      AppleShowAllExtensions = false;
      AppleShowAllExtensions = false;
      _FXShowPosixPathInTitle = true;
      CreateDesktop = true;
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      FXPreferredViewStyle = "clmv";
      ShowPathbar = true;
    };


    ".GlobalPreferences"."com.apple.sound.beep.sound" = "/System/Library/Sounds/hero";

    screencapture = {
      disable-shadow = false;
      location = "~/Documents/Screenshots";
    };

    CustomUserPreferences = {
      "com.apple.print.PrintingPrefs" = { "Quit When Finished" = true; }; # quit printer app once jobs complete
      "com.apple.AdLib" = { allowApplePersonalizedAdvertising = false; };

      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = true;
        # Check for software updates daily, not just once per week
        ScheduleFrequency = 1;
        # Download newly available updates in background
        AutomaticDownload = 1;
        # Install System data files & security updates
        CriticalUpdateInstall = 1;
      };

      "com.apple.desktopservices" = {
        # Avoid creating .DS_Store files on network or USB volumes
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      "com.apple.screensaver" = {
        # Require password immediately after sleep or screen saver begins
        askForPassword = 1;
        askForPasswordDelay = 0;
      };
    };

    # trackpad = {
    #   TrackpadThreeFingerDrag = true; # TODO is this working
    # };

    NSGlobalDomain = {
      _HIHideMenuBar = false;
      "com.apple.swipescrolldirection" = true;
      AppleICUForce24HourTime = false;
      AppleICUForce24HourTime = false;
      AppleInterfaceStyle = "Dark";
      AppleKeyboardUIMode = 3;
      AppleShowAllExtensions = false;
      AppleShowAllExtensions = false;
      AppleShowAllFiles = true;
      AppleShowScrollBars = "WhenScrolling";
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      "com.apple.trackpad.scaling" = 2.4;
      AppleWindowTabbingMode = "fullscreen";
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;
    };
  };
}
