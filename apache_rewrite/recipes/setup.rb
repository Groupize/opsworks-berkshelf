Chef::Log.info("Writing apache rewrite file.")
Chef::Log.info("Apache Directory: #{node[:apache][:dir]}")
if node[:apache][:dir] && !node[:apache][:dir].empty?
  path = "#{node[:apache][:dir]}/sites-available/white_label.conf.d"

  if File.exists?("#{path}/rewrite")
    Chef::Log.warn("Apache rewrite already exists; aborting")
  else
    FileUtils.mkdir_p(path)
    template "#{path}/rewrite" do
      source "rewrite.erb"
      mode 0644
      owner node[:deploy][:white_label][:user]
      group node[:deploy][:white_label][:group]
    end
  end
end
Chef::Log.info("Apache rewrite file written")
