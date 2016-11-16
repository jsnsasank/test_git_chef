#
# Cookbook Name:: execute
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

execute 'ex1' do
  command 'ls -l /etc > /tmp/sample.txt'
end

directory '/opt/tools/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/opt/tools/samplefile.txt' do
  content '<html>This is a sample file created by chef.</html>'
  mode '0755'
  owner 'root'
  group 'root'
end

package "httpd" do
 action :install
end

service "httpd" do
 action [:enable,:start]
end

time =  Time.new.strftime("%Y-%m-%d %H%M%S")

template "/tmp/example1.html" do
    source    "example.erb" 
    notifies :restart,"service[httpd]"
    variables(
      :time => time
    )
end

