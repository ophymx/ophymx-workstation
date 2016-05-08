if node['lsb']['release'] == '16.04'

  # Workaround while google-talkplugin repository is broken due to SHA1 removal.
  remote_dpkg_package 'google-talkplugin' do
    url 'https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb'
    checksum '9d878736e0c7a386dcd1abba237d28cfc76c44b933943cb6e9c0bcf10d5fa11d'
    action [:install]
  end

  file '/etc/apt/sources.list.d/google-talkplugin.list' do
    action [:delete]
  end

else
  apt_repository 'google-talkplugin' do
    uri 'http://dl.google.com/linux/talkplugin/deb/'
    distribution 'stable'
    components %w(main)
    key 'https://dl.google.com/linux/linux_signing_key.pub'
    action :add
  end

  package 'google-talkplugin' do
    action [:install, :upgrade]
  end
end
