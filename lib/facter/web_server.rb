Facter.add(:webserver_service) do
  setcode do
    confine :kernel => "Linux"
    case osfamily
    when 'Debian'
      'apache2'
    when 'RedHat'
      'httpd'
    end
  end
end
