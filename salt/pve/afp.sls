afp:
  pkg.installed:
    - pkgs:
      - netatalk
      - libc6-dev 
      - avahi-daemon
      - libnss-mdns

/etc/nsswitch.conf:
  file.line:
    - match: "^hosts:"
    - mode: replace
    - content: "hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns"

avahi-advertise:
  file.managed:
    - name: /etc/avahi/services/afpd.service
    - source: salt://{{ slspath }}/files/afpd.service
    - user: root
    - group: root
    - mode: 644

/mnt/nas/timemachine/mac-mini:
  file.directory:
    - makedirs: True
