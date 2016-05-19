golang_version = '1.6.2'
golang_checksum = 'e40c36ae71756198478624ed1bb4ce17597b3c19d243f3f0899bb5740d56212a'

golang_prefix = '/usr/local/go'
golang_cache_file = File.join(Chef::Config[:file_cache_path], "go#{golang_version}.linux-amd64.tar.gz")

remote_file golang_cache_file do
  source "https://storage.googleapis.com/golang/go#{golang_version}.linux-amd64.tar.gz"
  checksum golang_checksum
end

check_golang_version = Proc.new {
  go_cmd = File.join(golang_prefix, 'bin', 'go')
  File.executable?(go_cmd) &&
    %x{#{go_cmd} version} == "go version go#{golang_version} linux/amd64\n"
}

directory golang_prefix do
  recursive true
  action :delete
  not_if(&check_golang_version)
end

execute "tar -xzf #{golang_cache_file}" do
  creates golang_prefix
  cwd '/usr/local'
  not_if(&check_golang_version)
end

cookbook_file '/etc/profile.d/golang.sh' do
  source 'profile.d/golang.sh'
end
