Facter.add(:webserver, :type => :aggregate) do
  chunk(:webserver_types) do
    osfamily = Facter.value(:osfamily)
    value = {}
    case osfamily
    when 'Debian'
      value['service'] = 'apache2'
      value['package'] = 'apache2'
      value['user']    = 'www-data'
      value['group']   = 'www-data'
      value
    when 'RedHat'
      value['service'] = 'httpd'
      value['package'] = 'httpd'
      value['user']    = 'apache'
      value['group']   = 'apache'
      value
    end
  end
end

