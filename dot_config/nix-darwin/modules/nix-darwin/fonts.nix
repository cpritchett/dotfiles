{ pkgs, ... }: {
  fonts.fontDir.enable = true;

  fonts.fonts = with pkgs; [
    input-fonts
    ( nerdfonts.override {
        fonts = [
          "VictorMono"
          "DroidSansMono"
          "Mononoki"
          "FiraCode"
          #"fira-code-symbols"
          "FantasqueSansMono"
        ];
      })
  ];
}
