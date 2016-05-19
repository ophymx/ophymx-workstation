chruby_version = '0.3.9'
chruby_checksum = '7220a96e355b8a613929881c091ca85ec809153988d7d691299e0a16806b42fd'

chruby_prefix='/usr/local/chruby'
chruby_cache_file = File.join(Chef::Config[:file_cache_path], "chruby-#{chruby_version}.tar.gz")

def get_chruby_version
  chruby_exec = File.join(chruby_prefix, 'run', 'chruby-exec')
  return nil unless File.executable?(chruby_exec)
  version = %x{#{chruby_exec} --version}
  return nil unless version.start_with?('chruby version ')
  version[15..-1]
end

remote_file chruby_cache_file do
  source "https://github.com/postmodern/chruby/archive/v#{chruby_version}.tar.gz"
  checksum chruby_checksum
end

execute "tar -xzf #{chruby_cache_file}" do
  creates "/tmp/chruby-#{chruby_version}"
  cwd '/tmp'
  not_if { get_chruby_version == chruby_version }
end

directory "/usr/local/chruby" do
  recursive true
  action :delete
  not_if { get_chruby_version == chruby_version }
end

execute 'install-chruby' do
  command "make PREFIX=#{chruby_prefix} install"
  cwd "/tmp/chruby-#{chruby_version}"
  not_if { get_chruby_version == chruby_version }
end

cookbook_file '/etc/profile.d/chruby.sh' do
  source 'profile.d/chruby.sh'
end
