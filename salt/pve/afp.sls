afp:
  pkg.installed:
    - pkgs:
      - netatalk
      - libc6-dev 
      - avahi-daemon
      - libnss-mdns

/etc/nsswitch.conf:
  file.append:
    - text:
      - "hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4 mdns"