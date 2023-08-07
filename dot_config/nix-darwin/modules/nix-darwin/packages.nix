{ pkgs, nix-vars, ... }: {
  # System Wide
  environment.systemPackages = with pkgs; [
    coreutils
    curl
    fd 
    gnused
    neovim
    ripgrep
    tmux
  ];

  # User
  users.users."${nix-vars.username}".packages = with pkgs; [
    jq
    pueue
    notify
    nixpkgs-fmt
    zoxide
    tealdeer
    fclones
    exa
    starship
  ];

  # Homebrew
  homebrew = {
    enable = true;
    
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    
    global = {
      autoUpdate = true;
      brewfile = true;
    };
    
    taps = [
      "homebrew/services"
      "homebrew/cask-versions"
      "FelixKratz/formulae"
      "homebrew/command-not-found"
      "1password/tap"
      "hashicorp/tap"
      "keys-pub/tap"

    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      Amphetamine = 937984704;
      "Battery Health 2" = 1120214373;
      Magnet = 441258766;
      Meeter = 1510445899;
      Pocket = 568494494;
      "Save to Pocket" = 1477385213;
      "TrashMe 3" = 1490879410;
    };

    # NOTE: Casks are prefered because of weird placement of GUI Apps by Nix / Nix Darwin
    casks = [
      { name = "alfred";}  
      { name = "visual-studio-code";}
      { name = "logi-options-plus";}
      { name = "1password";}
      { name = "1password-cli";}
      { name = "aerial";}
      { name = "bartender";}
      { name = "iterm2";}
      { name = "keys";}
      { name = "trunk-io";}
      { name = "ytmdesktop-youtube-music";}
      { name = "insomnia";}
    ];

    brews = [
      "php" # For 2fm alfred plugin 
      "openssl" "readline" "sqlite3" "xz" "zlib" "tcl-tk" # Python Build Dependencies
      "asdf"
      "keys-pub/tap/keys"
      "ykman"
    ];

  };

}
