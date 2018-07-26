### Kernel update for MyGica230t2
backport_kernel:
  pkgrepo.managed:
    - humanname: stretch-backports
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - dist: stretch-backports
    - file: /etc/apt/sources.list.d/stretch-backports.list
#     - require_in:
#       - pkg: linux-image

#   pkg.latest:
#     - name: linux-image
#     - refresh: True