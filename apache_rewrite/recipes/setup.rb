Chef::Log.info("Writing apache rewrite file.")
Chef::Log.info("Apache Directory: #{node[:apache][:dir]}")
if node[:apache][:dir] && !node[:apache][:dir].empty?
  path = "#{node[:apache][:dir]}/sites-available/groupize.conf.d"

  if File.exists?("#{path}/rewrite")
    Chef::Log.warn("Apache rewrite already exists; aborting")
  else
    FileUtils.mkdir_p(path)
    template "#{path}/rewrite" do
      source "rewrite.erb"
      mode 0644
      owner node[:deploy][:groupize][:user]
      group node[:deploy][:groupize][:group]
    end
  end
end
Chef::Log.info("Apache rewrite file written")
