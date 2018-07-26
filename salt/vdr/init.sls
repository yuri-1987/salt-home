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

update_kernel:
  module.run:
    - name: kernelpkg_linux_apt.upgrade
