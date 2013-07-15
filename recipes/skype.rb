apt_repository 'skype-repo' do
  uri 'http://archive.canonical.com/ubuntu/'
  distribution node['lsb']['codename']
  components %w(partner)
  action :add
end

package 'skype' do
  action [:install, :upgrade]
end
