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
    - user: avahi
    - group: avahi
    - mode: 666

/mnt/nas/timemachine/mac-mini:
  file.directory:
    - makedirs: True

/etc/netatalk/AppleVolumes.default:
  file.managed:
    - source: salt://{{ slspath }}/files/AppleVolumes.default

{% for k,v in ({'ATALKD_RUN':'no','PAPD_RUN':'no','CNID_METAD_RUN':'yes','AFPD_RUN':'yes','TIMELORD_RUN':'no','A2BOOT_RUN':'no'}).items() %}
netatalk-{{ k }}:
  file.line:
    - name: /etc/default/netatalk
    - match: {{ k }}
    - mode: replace
    - content: {{ k }}={{ v }}
{% endfor %}

netatalk.service:
  service.running:
    - enable: True
    - watch:
      - file: /etc/netatalk/AppleVolumes.default

avahi-daemon:
  service.running:
    - enable: True
    - watch:
      - file: avahi-advertise