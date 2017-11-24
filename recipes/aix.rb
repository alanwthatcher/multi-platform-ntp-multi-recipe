# NTP configuration file
template config_path do
  owner 'root'
  group node['root_group']
  mode '0644'
  source ntp.conf.erb
  notifies :restart, "service[xntpd]"
end

# Ensure started at chef-client run time
service xntpd do
  action [:start]
end

# Enable xntpd via inittab
# We could certainly use a better custom provider here, as in the aix community cookbook
#   but for the sake of simplicity:
execute 'add xntpd to inittab on aix' do
  command 'mkitab ntpd:2:wait:/usr/bin/startsrc -x xntpd > /dev/null 2>&1'
  not_if 'lsitab ntpd'
end
