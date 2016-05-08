envy_code_r_url = 'http://download.damieng.com/fonts/original/EnvyCodeR-PR7.zip'
envy_code_r_file = 'EnvyCodeR-PR7.zip'
envy_code_r_cache_file = File.join(Chef::Config[:file_cache_path], envy_code_r_file)

remote_file envy_code_r_cache_file do
  source envy_code_r_url
  checksum '9f7e9703aaf21110b4e1a54d954d57d4092727546348598a5a8e8101e4597aff'
end

directory '/usr/local/share/fonts'

execute 'unzip-envy-code-r' do
  command "unzip #{envy_code_r_cache_file}"
  cwd '/usr/local/share/fonts'
  action :run
  not_if { File.exist?('/usr/local/share/fonts/Envy Code R PR7/Envy Code R.ttf') }
end
