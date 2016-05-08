if node['lsb']['release'] != '16.04'
  apt_repository 'daniel.pavel-solaar' do
    uri 'http://ppa.launchpad.net/daniel.pavel/solaar/ubuntu'
    distribution node['lsb']['codename']
    components %w(main)
    keyserver 'keyserver.ubuntu.com'
    key '06524FBA'
  end
end

package 'solaar'
