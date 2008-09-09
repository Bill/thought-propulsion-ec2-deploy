#!/usr/bin/env ruby
$:.unshift(File.expand_path(File.join( File.dirname(__FILE__), '../../lib/')))
require 'ec2-instance-data'
require 'register-ddns'

# always set hostname (if it's available)
`sudo hostname "#{EC2InstanceData.user_data['public-hostname']}"` if  EC2InstanceData.user_data.has_key? 'public-hostname'

# set dynamic DNS record if needed
RegisterDDNS.register