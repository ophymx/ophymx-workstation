remote_file File.join(Chef::Config[:file_cache_path], 'evrouter_0.4_amd64.deb') do
  source 'http://debian.bedroomlan.org/debian/pool/main/e/evrouter/evrouter_0.4_amd64.deb'
  checksum 'f17bfb2a44db7'
end

package 'evrouter_0.4_amd64.deb' do
  provider Chef::Provider::Package::Dpkg
  source File.join(Chef::Config[:file_cache_path], 'evrouter_0.4_amd64.deb')
  action :install
end
