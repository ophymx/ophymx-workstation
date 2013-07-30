packages = {}

packages[:dev] = %w(
  build-essential
  erlang
  gir1.2-gee-1.0
  gir1.2-glib-2.0
  gobject-introspection
  libgee-dev
  libgirepository1.0-dev
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
  links2
  vim-nox
)

packages[:desktop] = %w(
  arandr
  awesome
  feh
  flashplugin-installer
  gimp
  gtk-chtheme
  kazam
  shimmer-themes
  inkscape
  openshot
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
