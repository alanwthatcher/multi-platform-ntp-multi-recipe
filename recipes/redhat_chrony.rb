# Install package
package 'chrony' do
  only_if { node['platform'] == 'redhat' }
end

# NTP configuration file
template '/etc/chrony.conf' do
  owner 'root'
  group node['root_group'] # may ohai keep us forever sane
  mode '0644'
  source 'chrony.conf.erb' # rely on source being in platform directory of templates
  notifies :restart, "service[#{service_name}]"
end

# Chrony service setup
service service_name do
  action [:start, :enable]
end
