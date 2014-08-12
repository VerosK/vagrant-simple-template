require 'facter/util/file_read'

Facter.add(:role) do
  setcode do
    if File.exist? "/etc/puppet_role"
      puppet_role = Facter::Util::FileRead.read('/etc/puppet_role')
      puppet_role.first.chomp
    end
  end
end