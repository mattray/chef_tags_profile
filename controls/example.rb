title "check Chef tags"

# Chef node name as an input
# nodename = attribute('nodename', default: `hostname`.split('.')[0].strip)
# name = attribute('nodename', description: 'The chef environment for the node', default: 'dev')
# name = input('nodename')

chef_node = attribute('chef_node', description: 'Chef Node')

name = chef_node['config']['node_name']

# you add controls here
control "Check Chef tags" do
  impact 1.0
  title "green/brown tags"
  desc "Check if the Chef tag is green or brown (success) or missing (failure)"
  describe command("knife tag list #{name} -c /etc/chef/client.rb") do
    its('stdout') { should match (/green|brown/) }
  end
end
