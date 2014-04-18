package_version = '1.5.3'
package_file = "vagrant_#{package_version}_x86_64.deb"
cache_file = File.join(Chef::Config[:file_cache_path], package_file)
package_source = "https://dl.bintray.com/mitchellh/vagrant/#{package_file}"

remote_file cache_file do
  source package_source
  checksum '430c5553aeb'
end

package package_file do
  provider Chef::Provider::Package::Dpkg
  source cache_file
  action :install
end
