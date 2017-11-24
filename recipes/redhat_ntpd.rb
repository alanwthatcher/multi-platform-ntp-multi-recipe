# Confirm ntpd installed
package 'ntp'

# NTP configuration file
template '/etc/ntp.conf' do
  owner 'root'
  group node['root_group'] # may ohai keep us forever sane
  mode '0644'
  source 'ntp.conf.erb' # rely on source being in platform directory of templates
  notifies :restart, 'service[ntpd]'
end

# Service setup
service ntpd do
  action [:start, :enable]
end
