#
# Cookbook:: redis
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

instance = search("aws_opsworks_instance", "hostname:Master").first

node.default['redisio']['servers'] = [{'port' => '6379', 'slaveof' => { 'address' => instance['private_ip'], 'port' => '6379' }}]

include_recipe 'redisio::default'
include_recipe 'redisio::install'
include_recipe 'redisio::enable'