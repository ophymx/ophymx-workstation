apt_repository 'atlassian-hipchat' do
  uri 'http://downloads.hipchat.com/linux/apt'
  distribution 'stable'
  components %w(main)
  key 'https://www.hipchat.com/keys/hipchat-linux.key'
  action :add
end

package 'hipchat' do
  action [:install, :upgrade]
end
