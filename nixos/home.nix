{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.my_username = {
    /* The home.stateVersion option does not have a default and must be set */
    home.stateVersion = "18.09";
    /* Here goes the rest of your home-manager config, e.g. home.packages = [ pkgs.foo ]; */
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nix0s-rebuild switch";
      nix-cl="nix-collect-garbage -d";
      alias re="sudo reboot now";
      shut="sudo shutdown now";
      nf="neofetch";
      cl="clear";
      nv="nvim";
      bonsai="cbonsai -l -i";
      # so="xrandr --output eDP-1 --auto";
      # sof="xrandr --output eDP-1 --off";
      # lock="i3lock -i /home/quinton/Pictures/wallpapers/my-neighbor-totoro-sunflowers.png";
      i3config="nvim /home/quinton/.config/i3/config";
      weather="curl wttr.in";

      # VPN commands
      # wg-up="sudo wg-quick up wg0";
      # wg-down=" sudo wg-quick down wg0";
      # tup-work="sudo tailscale up --exit-node=quinton-vd --exit-node-allow-lan-access=true";
      # tup-home="sudo tailscale up --exit-node=btc-server --exit-node-allow-lan-access=true";
      # tdown="sudo tailscale down";

      # environment commands
      # wflower="feh --bg-fill ~/Pictures/wallpapers/flower.jpg";
      # wrand="feh --bg-fill --randomize ~/Pictures/wallpapers/";

      # Azure CLI
      # azure_email="sh /home/quinton/commands/az/scripts/username-email";
      # azure_obj="sh /home/quinton/commands/az/scripts/email-objid";
      };
      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";
      
      # Oh-My-Zsh Plugin
      oh-my-zsh = {
        enable = true;
	plugins = [ "git" "thefuck" ];
	theme = "bria";
      };
  };
  };
}
