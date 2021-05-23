Facter.add(:apache_processes) do
  
  setcode do
    confine :kernel => "Linux"
    osfamily = Facter.value(:osfamily)
    case osfamily
    when 'Debian'
      Facter::Core::Execution.execute('pgrep apache2|wc -l')
    when 'RedHat'
      Facter::Core::Execution.execute('pgrep httpd|wc -l')
    end
  end
end
