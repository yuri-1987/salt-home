nfs:
  pkg.installed:
    - pkgs:
      - nfs-common
      - nfs-kernel-server

rar:
  pkg.installed:
    - pkgs:
      - unar
      - unrar-free