minion-cron:
  file.managed:
    - name: /etc/salt/minion.d/autoupdate.conf
    - source: salt://{{ slspath }}/file/autoupdate.conf
    - user: root
    - group: root
    - mode: 0640

minion-service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: minion-cron