# This state audits operations data for linux systems

network: # Network configurations
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_ops && ip -a > /tmp/salt/linux_ops/"$(uname -n)_network"

hostname: # Hostname
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_ops && hostnamectl > /tmp/salt/linux_ops/"$(uname -n)_hostname"

who: # Who
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_ops && w > /tmp/salt/linux_ops/"$(uname -n)_who"

top: # Top
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_ops && top -b -n 1 > /tmp/salt/linux_ops/"$(uname -n)_top"

push: # Push results
  module.run:
    - name: cp.push_dir
    - path: /tmp/salt/linux_ops/
    - upload_path: /linux_ops