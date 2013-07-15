packages = {}

packages[:dev] = %w(
  build-essential
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
  pulseaudio-utils
  stunnel4
)

packages[:editors] = %w(
  vim-nox
)

packages[:desktop] = %w(
  arandr
  awesome
  pavucontrol
  pcmanfm
  pidgin
  synaptic
  synergy
  xfce4-power-manager
  zenity
)

packages.values.flatten.uniq.compact.each do |package_name|
  package package_name
end
