#
# Cookbook Name:: loop
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
node['loop']['pkgname'].each do |functionname|
 package functionname do
  action :install
 end
end

service "httpd" do
 action [:enable,:start]
end

git '/var/www/html/' do
  repository 'https://github.com/ls457/php_site'
  revision 'master'
  action :sync
end
