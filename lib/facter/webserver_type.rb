Facter.add(:webserver, :type => :aggregate) do
  chunk(:webserver_vars) do
    osfamily = Facter.value(:osfamily)
    value = {}
    case osfamily
    when 'Debian'
      value['service'] = 'apache2'
      value['package'] = 'apache2'
      value['user']    = 'www-data'
      value['group']   = 'www-data'
      value['config_path'] = '/etc/apache2/apache2.conf'
      value['vhosts_dir'] = '/etc/apache2/sites-available'
      value
    when 'RedHat'
      value['service'] = 'httpd'
      value['package'] = 'httpd'
      value['user']    = 'apache'
      value['group']   = 'apache'
      value['config_path'] = '/etc/httpd/conf/httpd.conf'
      value['vhosts_dir'] = '/etc/httpd/conf.d'
      value
    end
  end
end


