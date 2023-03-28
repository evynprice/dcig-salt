# This orchestration should be run from the salt master. It will connect to all linux minions and run the discovery state, then compile results.
# The master configuration `file_recv: True` must be set and then restart the master.

run_discovery:
  cmd.run:
    - name: salt -G 'os_family:Debian' state.apply comp.linux_comp

compile_results:
  cmd.run:
    - name: mkdir -p /srv/salt/reports/`date +"%Y%m%d"`/linux_comp/ && cp /var/cache/salt/master/minions/*/files/linux_comp/* /srv/salt/reports/`date +"%Y%m%d"`/linux_comp/ -vrf

clear_folder:
  cmd.run:
    - name: rm -r /var/cache/salt/master/minions/*/files/linux_comp