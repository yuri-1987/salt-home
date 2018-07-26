### Kernel update for MyGica230t2
backport_kernel:
  pkgrepo.managed:
    - humanname: stretch-backports
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - dist: stretch-backports
    - file: /etc/apt/sources.list.d/stretch-backports.list
    - require_in:
      - kernel: install_latest_kernel

update_packages:
   pkg.uptodate:
     - refresh: True
     - dist_upgrade: True
     - fromrepo: stretch-backports

install_latest_kernel:
  kernel.latest_installed: []