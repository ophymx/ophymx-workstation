apt_repository 'google-earth' do
  uri 'http://dl.google.com/linux/earth/deb/'
  distribution 'stable'
  components %w(main)
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  action :add
end

package 'google-earth-stable' do
  action [:install, :upgrade]
end
