Chef::Log.info("sourcing environment variables initializer")

node[:deploy].each do |application, deploy|
  Chef::Log.info("environment variables initializer deploy #{node[:deploy]}")
  Chef::Log.info("environment variables initializer deploy #{node[:deploy][application][:deploy_to]}")
  Chef::Log.info("environment variables initializer deploy #{node[:deploy][application][:environment_variables]}")

  template "#{node[:deploy][application][:deploy_to]}/shared/config/env_vars.rb" do
    source "env_vars.rb.erb"
    mode 0644
    owner node[:deploy][application][:user]
    group node[:deploy][application][:group]
    ignore_failure true
  end
end
