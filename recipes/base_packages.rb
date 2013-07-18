packages = {}

packages[:dev] = %w(
  build-essential
  erlang
  libreadline-dev
  libssl-dev
  libxml2-dev
  libxslt-dev
  libyajl-dev
  libyaml-dev
  zlib1g-dev
)

packages[:scripting] = %w(
  daemontools
  disktype
  gksu
  openvpn
  pulseaudio-utils
  pwgen
  stunnel4
  svtools
)

packages[:editors] = %w(
  vim-nox
)

packages[:desktop] = %w(
  arandr
  awesome
  feh
  flashplugin-installer
  gimp
  inkscape
  parcellite
  pavucontrol
  pcmanfm
  pidgin
  synaptic
  synergy
  terminator
  xfce4-power-manager
  xfce4-screenshooter
  zenity
  xscreensaver
)

packages.values.flatten.uniq.compact.each do |package_name|
  package package_name
end
