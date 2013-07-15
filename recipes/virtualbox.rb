apt_repository 'virtualbox-repo' do
  uri 'http://download.virtualbox.org/virtualbox/debian'
  distribution node['lsb']['codename']
  components %w(contrib)
  key 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc'
  action :add
end

package 'virtualbox-4.2' do
  action [:install, :upgrade]
end
