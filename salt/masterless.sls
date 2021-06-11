install_git:
  pkg.installed:
    - name: git

salt-minion:
  pkg:
    - latest
  service:
    - dead
    - enable: False

/etc/salt/minion.d/masterless.conf:
  file.managed:
    - source: salt://salt/masterless.conf

/srv/salt:
  file.directory:
    - user: root
    - group: root
    - mode: 700
    - makedirs: True

clone_latest_states:
  git.latest:
    - name: https://github.com/kbaikov/salt-states.git
    - target: /srv/salt
    - force_checkout: True

/etc/systemd/system/salt-masterless.service:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt/salt-masterless.service
    - template: jinja

/etc/systemd/system/salt-masterless.timer:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://salt/salt-masterless.timer

salt-masterless.timer:
  service.running:
    - enable: True
    - require:
      - file: /etc/systemd/system/salt-masterless.timer