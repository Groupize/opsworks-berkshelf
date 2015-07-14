Chef::Log.info("sourcing environment variables initializer")
Chef::Log.info("deploy #{node[:deploy]}")
Chef::Log.info("deploy #{node[:deploy][:groupize][:deploy_to]}")
Chef::Log.info("deploy #{node[:deploy][:groupize][:environment_variables]}")
template "#{node[:deploy][:groupize][:deploy_to]}/shared/config/env_vars.rb" do
  source "env_vars.rb.erb"
  mode 0644
  owner node[:deploy][:groupize][:user]
  group node[:deploy][:groupize][:group]
end
