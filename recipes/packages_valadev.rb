%w(
  build-essential
  gir1.2-gee-0.8
  gir1.2-glib-2.0
  gobject-introspection
  libfcgi-dev
  libgee-0.8-dev
  libgirepository1.0-dev
  libreadline-dev
  libssl-dev
  libxml2-dev
  libxslt-dev
  libyajl-dev
  libyaml-dev
  zlib1g-dev
).each do |package_name|
  package package_name
end
