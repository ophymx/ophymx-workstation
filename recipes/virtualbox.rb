suite = node['lsb']['codename'] == 'trusty' ?
  'saucy' : node['lsb']['codename']

apt_repository 'virtualbox-repo' do
  uri 'http://download.virtualbox.org/virtualbox/debian'
  distribution suite
  components %w(contrib)
  key 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
  action :add
end

package 'virtualbox-4.3' do
  action [:install, :upgrade]
end
