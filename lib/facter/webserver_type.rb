Facter.add(:webserver) do
  setcode do
    confine :kernel => "Linux"
    osfamily = Facter.value(:osfamily)
    case osfamily
    when 'Debian'
      value = new Hash()
      value[:service] = 'apache2'
      value[:package] = 'apache2'
      value[:user]    = 'www-data'
      value[:group]   = 'www-data'
      value
    when 'RedHat'
      value[:service] = 'httpd'
      value[:package] = 'httpd'
      value[:user]    = 'apache'
      value[:group]   = 'apache'
      value
    end
  end
end
