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

/etc/netatalk/AppleVolumes.default:
  file.append:
    - text: |
        :DEFAULT: options:upriv,usedots,tm
        /mnt/nas/timemachine/mac-mini "TimeMachine Mac-Mini"

{% for k,v in ({'ATALKD_RUN':'no','PAPD_RUN':'no','CNID_METAD_RUN':'yes','AFPD_RUN':'yes','TIMELORD_RUN':'no','A2BOOT_RUN':'no'}).items() %}
netatalk-{{ k }}:
  file.line:
    - match: {{ k }}
    - mode: replace
    - content: {{ k }}={{ v }}
{% endfor %}