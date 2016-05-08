apt_repository 'webupd8team-atom' do
  uri 'http://ppa.launchpad.net/webupd8team/atom/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'EEA14886'
end

package 'atom'
