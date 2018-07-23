set_gitfs:
  file.managed:
    - name: /etc/salt/master.d/fileserver.conf
    - source: salt://{{ slspath }}/files/fileserver.conf

reactor_conf:
  file.managed:
    - name: /etc/salt/master.d/reactor.conf
    - source: salt://{{ slspath }}/files/reactor.conf

master_service:
  service.running:
    - name: salt-master
    - enable: True
    - watch:
      - file: set_gitfs
      - file: reactor_conf