apt_repository 'vala-team' do
  uri 'http://ppa.launchpad.net/vala-team/ppa/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key '7DAAC99C'
end

package 'valac-0.20'
