### Backport Repo for Kernel update
backport_kernel:
  pkgrepo.managed:
    - humanname: stretch-backports
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - dist: stretch-backports
    - file: /etc/apt/sources.list.d/stretch-backports.list

update_packages:
   pkg.uptodate:
     - refresh: True
     - dist_upgrade: True
     - fromrepo: stretch-backports

### Download and extract firmware for mygica230c
extract_myapp:
  archive.extracted:
    - name: /lib/firmware/
    - source: https://bitbucket.org/CrazyCat/media_build/downloads/dvb-firmwares.tar.bz2
    - user: root
    - group: root
    - unless:
      - ls /lib/firmware/dvb-demod-si2168-d60-01.fw
      - ls /lib/firmware/dvb-tuner-si2141-a10-01.fw

vdr_video_dir:
  file.directory:
    - name: /var/lib/video
    - user: 109
    - group: 113
    - mode: 755
    - makedirs: True

vdr_packages:
  pkg.installed:
    - pkgs:
      - vdr
      - dvb-apps
      - vdr-plugin-vnsiserver
      - w_scan

vdr:
  service.running:
    - enable: True
    - reload: True

run_installer:
  cmd.run:
    - name: w_scan -f t -c IL >> /var/lib/vdr/channels.conf
  watch_in: vdr