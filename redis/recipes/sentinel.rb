#
# Cookbook:: redis
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

instance = search("aws_opsworks_instance", "hostname:Master").first
#node.default['redisio']['sentinels'] = [{'port' => '16379', 'name' => 'mycluster', 'master_ip' => instance['private_ip'], 'master_port' => 6379}]
node.default['redisio']['sentinels'] = [{ 'sentinel_port' => '16379', 'name' => 'mycluster_sentinel', 'masters' => [{ 'master_name' => 'master6379', 'master_ip' => instance['private_ip'], 'master_port' => 6379, 'quorum_count' => 2}] }]

include_recipe 'redisio::sentinel'
include_recipe 'redisio::sentinel_enable'