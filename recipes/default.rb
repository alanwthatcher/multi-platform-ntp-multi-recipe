#
# Cookbook:: multi-platform-ntp-multi-recipe
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform']
when 'redhat'
  # Find Red Hat release version
  pv = node['platform_version'].split('.')[0]

  # Call provider recipe based on platform version
  include_recipe 'multi-platform-ntp-multi-recipe::redhat_ntpd' if pv == '6'
  include_recipe 'multi-platform-ntp-multi-recipe::redhat_chrony' if pv == '7'

when 'aix'
  # Call AIX platform recipe
  include_recipe 'multi-platform-ntp-multi-recipe::aix'

end
