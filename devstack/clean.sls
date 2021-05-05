run_unstack_clean:
  cmd.run:
    - names:
      - /opt/stack/devstack/unstack.sh | true
      - /opt/stack/devstack/clean.sh | true
    - onlyif: test -x /opt/stack/devstack/unstack.sh
    - cwd: /opt/stack/devstack
    - runas: stack
