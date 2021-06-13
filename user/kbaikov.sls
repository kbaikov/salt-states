add_kbaikov_user:
  user.present:
    - name: kbaikov
    - home: /home/kbaikov
    - createhome: True
    - shell: /bin/bash

add_ed25519_entry_to_authorized_key_file:
  ssh_auth.present:
    - user: kbaikov
    - enc: ssh-rsa
    - names:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILP08PefL84ODynwz7XsRaT++itVgx9iiRN8oxyWYYGK bmcb@q

passwordless_sudo:
  file.managed:
    - name: /etc/sudoers.d/kbaikov
    - mode: 440
    - contents:
      - 'kbaikov ALL=(ALL) NOPASSWD: ALL'


userfiles_kbaikov_home_recursive:
  file.recurse:
    - name: /home/kbaikov
    - source: salt://user/kbaikov_home
    - user: kbaikov
    - group: kbaikov
    - clean: False
    - include_empty: True
    - keep_symlinks: True
    - require:
      - user: add_kbaikov_user