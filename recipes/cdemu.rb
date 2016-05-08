apt_repository 'cdemu' do
  uri 'http://ppa.launchpad.net/cdemu/ppa/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'D782A00F'
end

package 'gcdemu'
package 'cdemu-client'
