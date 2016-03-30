if hiera('bootstrap_nodeid', undef) =~ /^overcloud-controller/ { # 1

  include ::cinder::params # 2
  
  $cinder_netapp_backend = 'tripleo_netapp'
  $cinder_netapp_nfs_shares = undef
  cinder::backend::netapp { $cinder_netapp_backend :
    netapp_login                 => 'user',
    netapp_password              => 'password', 
    netapp_server_hostname       => 'netapp1-test.example.net', 
    netapp_server_port           => '80', 
    netapp_size_multiplier       => '1.2',
    netapp_storage_family        => 'ontap_cluster', 
    netapp_storage_protocol      => 'nfs',
    netapp_transport_type        => 'http',
    netapp_vfiler                => undef,
    netapp_volume_list           => undef,
    netapp_vserver               => undef,
    netapp_partner_backend_name  => undef,
    nfs_shares                   => $cinder_netapp_nfs_shares,
    nfs_shares_config            => '/etc/cinder/shares.conf',
    netapp_copyoffload_tool_path => undef,
    netapp_controller_ips        => undef,
    netapp_sa_password           => undef,
    netapp_storage_pools         => undef,
    netapp_eseries_host_type     => 'linux_dm_mp',
    netapp_webservice_path       => '/devmgr/v2',
  }

  $cinder_netapp2_backend = 'tripleo_netapp2'
  $cinder_netapp2_nfs_shares = undef
  cinder::backend::netapp { $cinder_netapp2_backend :
    netapp_login                 => 'user2',
    netapp_password              => 'password2', 
    netapp_server_hostname       => 'netapp2-test.example.net', 
    netapp_server_port           => '80', 
    netapp_size_multiplier       => '1.2',
    netapp_storage_family        => 'ontap_cluster', 
    netapp_storage_protocol      => 'nfs',
    netapp_transport_type        => 'http',
    netapp_vfiler                => undef,
    netapp_volume_list           => undef,
    netapp_vserver               => undef,
    netapp_partner_backend_name  => undef,
    nfs_shares                   => $cinder_netapp2_nfs_shares,
    nfs_shares_config            => '/etc/cinder/shares.conf',
    netapp_copyoffload_tool_path => undef,
    netapp_controller_ips        => undef,
    netapp_sa_password           => undef,
    netapp_storage_pools         => undef,
    netapp_eseries_host_type     => 'linux_dm_mp',
    netapp_webservice_path       => '/devmgr/v2',
  }
  
  cinder_config {
    "DEFAULT/enabled_backends": value => "$cinder_netapp_backend,$cinder_netapp2_backend"; # 5
  }
}
