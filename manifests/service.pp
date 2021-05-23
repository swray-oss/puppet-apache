# @summary
#   Service control for apache
class apache::service {
  service { "${apache::service_name}":
    alias      => apache_service,
    ensure     => $apache::service_ensure,
    enable     => $apache::service_enable,
    hasrestart => true,
  }
}
