afp:
  pkg.installed:
    - pkgs:
      - netatalk
      - libc6-dev 
      - avahi-daemon
      - libnss-mdns

timemachine_group:
  group.present:
    - name: timemachine
    - gid: 9999
    - system: True

timemachine_user:
  user.present:
    - name: timemachine
    - fullname: timemachine
    - shell: /bin/bash
    - home: /home/timemachine
    - uid: 9999
    - gid: 9999
    - password: $1$rmmKSQDH$sfR44PNahvdcexE1fVz9e1

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
    - user: timemachine

/etc/netatalk/AppleVolumes.default:
  file.managed:
    - source: salt://{{ slspath }}/files/AppleVolumes.default

/etc/netatalk/afpd.conf:
  file.managed:
    - source: salt://{{ slspath }}/files/afpd.conf

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
      - file: /etc/netatalk/afpd.conf

avahi-daemon:
  service.running:
    - enable: True
    - watch:
      - file: avahi-advertise
