install_pihole_service_file:
  file.managed:
    - name: /etc/systemd/system/pihole.service
    - source: salt://pihole/pihole.service


pull_pihole_image:
  cmd.run:
    - name: podman pull pihole/pihole:latest

start_pihole:
  service.running:
    - name: pihole
    - enable: True