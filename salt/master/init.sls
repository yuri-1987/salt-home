set_gitfs:
  file.managed:
    - name: /etc/salt/master.d/fileserver.conf
    - source: salt://master/files/fileserver.conf