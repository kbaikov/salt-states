stop_homeassistant:
  service.dead:
    - name: home-assistant

pull_homeassistant_image:
  cmd.run:
    - name: podman pull homeassistant/home-assistant:latest

start_homeassistant:
  service.running:
    - name: home-assistant
    - enable: True

system_prune_after_homeassistant_update:
  cmd.run:
    - name: podman system prune --all --force
