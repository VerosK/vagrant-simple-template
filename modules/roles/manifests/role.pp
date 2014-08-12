#
# Set role for this host according to Puppet Roles pattern
#
# Role is stored in /etc/puppet_role
#
# Usage:
#   roles::role{"webserver":}
#
define roles::role(
  $roleName = hiera('puppet_role', $title)
){
  if !$roleName {
    fail('roleName has to be defined.')
  }

  #validate_string($roleName) # if we have stdlib

  file { '/etc/puppet_role':
    ensure  => file,
    content => "${roleName}\n"
  }

  # compare old role from facter with new role
  if $::role != $roleName {
    warning("Changing role from '${::role}' to '${roleName}'.  You probably should run Puppet again.")
  }
}
