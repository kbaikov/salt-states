install_home-assistant_service_file:
  file.managed:
  - name: /etc/systemd/system/home-assistant.service
  - source: salt://homeassistant/home-assistant.service


pull_homeassistant_image:
  cmd.run:
    - name: podman pull homeassistant/home-assistant:latest


start_homeassistant:
  service.running:
    - name: home-assistant
    - enable: True