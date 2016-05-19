ruby_install_version = '0.6.0'
ruby_install_checksum = '3cc90846ca972d88b601789af2ad9ed0a496447a13cb986a3d74a4de062af37d'

ruby_install_prefix='/usr/local/ruby-install'
ruby_install_cache_file = File.join(Chef::Config[:file_cache_path], "ruby-install-#{ruby_install_version}.tar.gz")

def get_ruby_install_version
  ruby_install = File.join(ruby_install_prefix, 'run', 'ruby-install')
  return nil unless File.executable?(ruby_install)
  version = %x{#{ruby_install} --version}
  return nil unless version.start_with?('ruby-install: ')
  version[14..-1]
end

remote_file ruby_install_cache_file do
  source "https://github.com/postmodern/ruby-install/archive/#{ruby_install_version}.tar.gz"
  checksum ruby_install_checksum
end

execute "tar -xzf #{ruby_install_cache_file}" do
  creates "/tmp/ruby-install-#{ruby_install_version}"
  cwd '/tmp'
  not_if { get_ruby_install_version == ruby_install_version }
end

directory "/usr/local/ruby-install" do
  recursive true
  action :delete
  not_if { get_ruby_install_version == ruby_install_version }
end

execute 'install-ruby-install' do
  command "make PREFIX=#{ruby_install_prefix} install"
  cwd "/tmp/ruby-install-#{ruby_install_version}"
  not_if { get_ruby_install_version == ruby_install_version }
end

cookbook_file '/etc/profile.d/ruby-install.sh' do
  source 'profile.d/ruby-install.sh'
end
