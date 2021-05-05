run_stack:
  cmd.run:
    - name: /opt/stack/devstack/stack.sh > /dev/null 2>&1 &
    - cwd: /opt/stack/devstack
    - runas: stack
    - hide_output: true