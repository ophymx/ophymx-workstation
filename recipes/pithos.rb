apt_repository 'pithos-daily' do
  uri 'http://ppa.launchpad.net/kevin-mehall/pithos-daily/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'C32A36BF'
end

package 'pithos' do
  action [:install, :upgrade]
end
