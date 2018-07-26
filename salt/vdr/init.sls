### Kernel update for MyGica230t2
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

install-latest-kernel:
  kernel.latest_installed: []

boot-latest-kernel:
  kernel.latest_active:
    - at_time: 1
    - onchanges:
      - kernel: install-latest-kernel