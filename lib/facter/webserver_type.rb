Facter.add('webserver_type') do
  setcode do
    confine :kernel => "Linux"
    osfamily = Facter.value(:osfamily)
    case osfamily
    when 'Debian'
      service = 'apache2'
      package = 'apache2'
      user = 'www-data'
      group = 'www-data'
    when 'RedHat'
      service = 'httpd'
      package = 'httpd'
      user = 'apache'
      group = 'apache'
    end
  end
end
