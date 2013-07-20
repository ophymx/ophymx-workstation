user_home = File.join('/home', node['ophymx']['user'])

%w(.sv .config .config/terminator .config/awesome).each do |dir|
  directory File.join(user_home, dir) do
    owner node['ophymx']['user']
    group node['ophymx']['group']
  end
end

user_scripts = {
  'xinitrc' => '.xinitrc',
  'xinitrc.inputs' => '.xinitrc.inputs',
}
user_scripts.each_pair do |src, dst|
  cookbook_file File.join(user_home, dst) do
    source src
    mode 00755
    owner node['ophymx']['user']
    group node['ophymx']['group']
  end
end

sv_services = %w(
  awesome
  gnome-keyring
  gnome-polkit
  nm-applet
  parcellite
  print-applet
  update-notifier
  xfce4-power-manager
  xscreensaver
)
sv_services.each do |service|
  directory File.join(user_home, '.sv', service) do
    owner node['ophymx']['user']
    group node['ophymx']['group']
  end
  cookbook_file File.join(user_home, '.sv', service, 'run') do
    source File.join('sv', service, 'run')
    mode 00755
    owner node['ophymx']['user']
    group node['ophymx']['group']
  end
end

user_configs = {
  'synclientrc' => '.synclientrc',
  'xmodmaprc' => '.xmodmaprc',
  'xscreensaver' => '.xscreensaver',
  'xscreensaver-resources' => '.xscreensaver-resources',
  'terminator.config' => '.config/terminator/config',
  'awesome.rc.lua' => '.config/awesome/rc.lua',
  'sv/common.sh' => '.sv/common.sh',
  'evrouterrc-scroll' => '.evrouterrc-scroll',
  'evrouterrc-volume' => '.evrouterrc-volume',
}
user_configs.each_pair do |src, dst|
  cookbook_file File.join(user_home, dst) do
    source src
    mode 00644
    owner node['ophymx']['user']
    group node['ophymx']['group']
  end
end
