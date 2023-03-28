# This orchestration should be run from the salt master. It will connect to all linux minions and run the discovery state, then compile results.
# The master configuration `file_recv: True` must be set and then restart the master.

run_discovery:
  cmd.run:
    - name: salt -G 'os_family:Debian' state.apply ops.linux_ops

compile_results:
  cmd.run:
    - name: mkdir -p /srv/salt/reports/`date +"%Y%m%d"`/linux_ops/ && cp /var/cache/salt/master/minions/*/files/linux_ops/* /srv/salt/reports/`date +"%Y%m%d"`/linux_ops/ -vrf

clear_folder:
  cmd.run:
    - name: rm -r /var/cache/salt/master/minions/*/files/linux_ops