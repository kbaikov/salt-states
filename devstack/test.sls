run_stack:
  cmd.script:
    - name: /opt/stack/devstack/run_tests.sh
    - cwd: /opt/stack/devstack
    - runas: stack