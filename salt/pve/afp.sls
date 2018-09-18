afp:
  pkg.installed:
    - pkgs:
      - netatalk
      - libc6-dev 
      - avahi-daemon
      - libnss-mdns

/etc/nsswitch.conf:
  file.replace:
    - pattern: |
        hosts(.*)
    - repl: "hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns"
    - append_if_not_found: true

avahi-advertise:
  file.managed:
    - name: /etc/avahi/services/afpd.service
    - source: salt://{{ slspath }}/files/afpd.service
    - user: root
    - group: root
    - mode: 644

/mnt/nas/timemachine/mac-mini:
  file.directory
