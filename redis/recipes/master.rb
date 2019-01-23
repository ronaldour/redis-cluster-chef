#
# Cookbook:: redis
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'redisio::default'
include_recipe 'redisio::install'
include_recipe 'redisio::enable'