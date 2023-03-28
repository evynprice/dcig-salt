# This state audits compliance configurations for linux systems

# Ensure netstat is installed
net-tools:
  pkg.installed

network: # Ports and Services
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_comp && netstat -ano > /tmp/salt/linux_comp/"$(uname -n)_netstat"

installed: # Installed Software and Security Updates
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_comp && apt list --installed > /tmp/salt/linux_comp/"$(uname -n)_apt"

users: # Users and Groups with Password Complexity and Age
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_comp && cat /etc/passwd > /tmp/salt/linux_comp/"$(uname -n)_passwd" #Local Users

os: # Operating system(s) (including version) or firmware where no independent operating system exists 
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_comp && lsb_release -a > /tmp/salt/linux_comp/"$(uname -n)_os"

logging: # Syslog Logging Settings
  cmd.run:
  - name: mkdir -p /tmp/salt/linux_comp && cat /etc/rsyslog.conf > /tmp/salt/linux_comp/"$(uname -n)_syslog"

push: # Push results
  module.run:
    - name: cp.push_dir
    - path: /tmp/salt/linux_comp/
    - upload_path: /linux_comp