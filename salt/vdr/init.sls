### Kernel update for MyGica230t2
backport_kernel:
  pkgrepo.managed:
    - humanname: stretch-backports
    - name: deb http://ftp.debian.org/debian stretch-backports main
    - dist: stretch-backports
    - file: /etc/apt/sources.list.d/stretch-backports.list
    # - require_in:
    #   - kernel.latest_installed: install_latest_kernel

dist_upgrade:
  module.run:
    - name: pkg.upgrade
    - refresh: true
    - dist_upgrade: false
    - opts:
        -t: stretch-backports


# install_latest_kernel:
#   kernel.latest_installed: []