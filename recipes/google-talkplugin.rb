apt_repository 'google-talkplugin' do
  uri 'http://dl.google.com/linux/talkplugin/deb/'
  distribution 'stable'
  components %w(main)
  key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  action :add
end

package 'google-talkplugin' do
  action [:install, :upgrade]
end
