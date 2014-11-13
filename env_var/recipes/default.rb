Chef::Log.info("sourcing environment variables initializer")
Chef::Log.info("deploy #{node[:deploy]}")
Chef::Log.info("deploy #{node[:deploy][:white_label][:deploy_to]}")
Chef::Log.info("deploy #{node[:deploy][:white_label][:environment_variables]}")
template "#{node[:deploy][:white_label][:deploy_to]}/shared/config/env_vars.rb" do
  source "env_vars.rb.erb"
  mode 0644
  owner node[:deploy][:white_label][:user]
  group node[:deploy][:white_label][:group]
end
