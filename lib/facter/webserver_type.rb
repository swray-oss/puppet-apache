Facter.add(:webserver_type) do
  setcode do
    confine :kernel => "Linux"
    osfamily = Facter.value(:osfamily)
    case osfamily
    when 'Debian'
      'apache2'
    when 'RedHat'
      'httpd'
    end
  end
end
