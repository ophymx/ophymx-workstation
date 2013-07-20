include_recipe 'ophymx-workstation::default'

include_recipe 'ophymx-workstation::user-session'

config_files = %w(
  /etc/udev/rules.d/40-powermate.rules
  /usr/share/xsessions/custom.desktop
  /usr/share/X11/xorg.conf.d/11-evdev-rat5.conf
)

config_files.each do |config_file|
  cookbook_file config_file do
    mode 00644
    owner 'root'
    group 'root'
  end
end

scripts = %w(wheel-ctrl vol_ctl dock touchpad-toggle wacom-touch session-control)

scripts.each do |script|
  cookbook_file File.join('/usr/local/bin', script) do
    mode 00755
    owner 'root'
    group 'root'
  end
end

link '/usr/local/bin/undock' do
  to 'dock'
end
