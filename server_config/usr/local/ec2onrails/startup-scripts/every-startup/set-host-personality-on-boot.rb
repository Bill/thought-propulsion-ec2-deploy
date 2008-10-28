#!/usr/bin/env ruby
$:.unshift(File.expand_path(File.join( File.dirname(__FILE__), '../../lib/')))
require 'ec2-instance-data'
require 'register-ddns'

# ImageScience bug http://rubyforge.org/tracker/?group_id=1513&atid=5921&func=detail&aid=22585
# needs this link
`[ -e /usr/lib/libstdc++.so ] || ln -s /usr/lib/libstdc++.so.6 /usr/lib/libstdc++.so`

# always set hostname (if it's available)
`sudo hostname "#{EC2InstanceData.user_data['public-hostname']}"` if  EC2InstanceData.user_data.has_key? 'public-hostname'

# set dynamic DNS record if needed
RegisterDDNS.register