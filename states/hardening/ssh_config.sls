sshd_conf:
  file:
    - managed
    - name: /etc/ssh/sshd_config
    - source: salt://states/hardening/files/sshd_config
    - user: root
    - group: root
    - mode: 644