apt_repository 'webupd8team-java' do
  uri 'http://ppa.launchpad.net/webupd8team/java/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'EEA14886'
end

debconf_selection 'shared/accepted-oracle-license-v1-1' do
  package 'oracle-java8-installer'
  type 'select'
  value 'true'
end

package 'oracle-java8-installer'
package 'oracle-java8-set-default'
