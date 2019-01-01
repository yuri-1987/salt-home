{% set dockerblock = salt['cmd.run']('lsblk -S | grep 0:0:0:1 | awk \'{print \$1}\'') %}
docker_storage_volume_format:
  blockdev.formatted:
    - name: /dev/{{ dockerblock }}
    - fs_type: ext4

docker_storage_volume_mount:
  mount.mounted:
    - name: /var/lib/docker1
    - device: /dev/{{ dockerblock }}
    - fstype: ext4
    - mkmnt: True
    - opts: defaults
    - persist: True
    - mount: True
    - dump: 0
    - pass_num: 0
    - require:
      - blockdev: docker_storage_volume_format