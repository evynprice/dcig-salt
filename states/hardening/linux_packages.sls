ntp:
  pkg:
    - latest
  service:
    - running
    - enable: True

fail2ban:
  pkg:
    - latest
  service:
    - running

telnet:
  pkg:
  - purged