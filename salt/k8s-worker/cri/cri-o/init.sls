

/etc/systemd/system/crio.service:
    file.managed:
    - source: salt://k8s-worker/cri/cri-o/crio.service
    - user: root
    - template: jinja
    - group: root
    - mode: 644

cri-o:
  service.running:
    - enable: True
    - watch:
      - /etc/systemd/system/crio.service