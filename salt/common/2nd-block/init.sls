{%- if salt['partition.get_block_device']()[1] == "sdb" -%}
backup_volume:
  blockdev.formatted:
    - name: /dev/sdb
    - fs_type: ext4
{% endif %}