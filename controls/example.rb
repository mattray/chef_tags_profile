title "check Chef tags"

# Chef node name as an input
nodename = input('nodename', value: `hostname`.split('.')[0].strip)

# you add controls here
control "Check Chef tags" do
  impact 1.0
  title "green/brown tags"
  desc "Check if the Chef tag is green or brown (success) or missing (failure)"
  describe command("knife tag list #{nodename} -c /etc/chef/client.rb") do
    its('stdout') { should match (/green|brown/) }
  end
end