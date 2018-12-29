{%- if salt['partition.get_block_device']()[1] == "sdb" -%}
docker_storage_volume_format:
  blockdev.formatted:
    - name: /dev/sdb
    - fs_type: ext4

docker_storage_volume_mount:
  mount.mounted:
    - name: /var/lib/docker
    - device: /dev/sdb
    - fstype: ext4
    - mkmnt: True
    - opts: defaults
    - persist: True
    - mount: True
    - dump: 0
    - pass_num: 0
    - require:
      - blockdev: docker_storage_volume_format
{% endif %}