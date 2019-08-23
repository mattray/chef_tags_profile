# Chef tag check

This example profile shows how to check for the existence of "brown" or "green" tags as applied to a Chef node. It uses the "hostname" command to match the Chef nodename, which may be incorrect. It will take an input for the nodename (ie. within the context of an Audit cookbook for example), but that hasn't been thoroughly tested. The nodename is used with the command

```
knife tag list NODENAME -c /etc/chef/client.rb
```

from the node to see what tags are applied. It's currently hardcoded for "brown" or "green" but could be extended as necessary.
