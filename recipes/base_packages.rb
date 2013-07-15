packages = {}

packages[:dev] = %w(
  build-essential
  git
  libreadline-dev
  libssl-dev
  libxml2-dev
  libxslt-dev
  libyajl-dev
  libyaml-dev
  zlib1g-dev
)

packages[:scripting] = %w(
  curl
  daemontools
  pulseaudio-utils
)

packages[:editors] = %w(
  vim-nox
)

packages[:desktop] = %w(
  arandr
  awesome
  pavucontrol
  zenity
)

packages.values.flatten.uniq.compact.each do |package_name|
  package package_name
end
