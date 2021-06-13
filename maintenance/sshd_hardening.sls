sshd_root_restrict_login:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^\s*PermitRootLogin.*[yY]es.*'
    - repl: 'PermitRootLogin no'

sshd_disable_PasswordAuthentication:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^\s*PasswordAuthentication.*[yY]es.*'
    - repl: 'PasswordAuthentication no'

sshd_disable_X11Forwarding:
  file.replace:
    - name: /etc/ssh/sshd_config
    - pattern: '^\s*X11Forwarding .*[yY]es.*'
    - repl: 'X11Forwarding no'
