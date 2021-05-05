/etc/systemd/system/q-salt-backup.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://maintenance/q-salt-backup.service
    - template: jinja

/etc/systemd/system/q-salt-backup.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://maintenance/q-salt-backup.timer
    - require:
      - file: /etc/systemd/system/q-salt-backup.service

q-salt-backup.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/q-salt-backup.timer