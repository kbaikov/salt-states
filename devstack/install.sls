install_git:
  pkg.installed:
    - name: git

add_stack_user:
  user.present:
    - name: stack
    - home: /opt/stack
    - createhome: True
    - shell: /bin/bash

add_sudoers_file:
  file.managed:
    - name: /etc/sudoers.d/stack
    - contents:
      - "stack ALL=(ALL) NOPASSWD: ALL"


clone_latest_devstack:
  git.latest:
    - name: https://opendev.org/openstack/devstack
    - rev: master
    - target: /opt/stack/devstack
    - user: stack
    - depth: 1
    - force_checkout: True
    - require:
      - install_git

add_local_conf:
  file.managed:
    - name: /opt/stack/devstack/local.conf
    - source: salt://devstack/local.conf
    - user: stack

