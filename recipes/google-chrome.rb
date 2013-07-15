apt_repository 'google-chrome' do
  uri 'http://dl.google.com/linux/chrome/deb/'
  distribution 'stable'
  components %w(main)
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  action :add
end

package 'google-chrome-stable' do
  action [:install, :upgrade]
end
