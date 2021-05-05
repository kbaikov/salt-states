pull_pihole_image1:
  cmd.run:
    - name: podman pull pihole/pihole:latest

stop_pihole:
  service.dead:
    - name: pihole

pull_pihole_image2:
  cmd.run:
    - name: podman pull pihole/pihole:latest

start_pihole:
  service.running:
    - name: pihole
    - enable: True

system_prune_after_pihole_update:
  cmd.run:
    - name: podman system prune --all --force
