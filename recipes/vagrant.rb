package_file = 'vagrant_1.2.4_x86_64.deb'
cache_file = File.join(Chef::Config[:file_cache_path], package_file)
package_source = 'http://files.vagrantup.com/packages/0219bb87725aac28a97c0e924c310cc97831fd9d/vagrant_1.2.4_x86_64.deb'

remote_file cache_file do
  source package_source
end

package package_file do
  provider Chef::Provider::Package::Dpkg
  source cache_file
  action :install
end
