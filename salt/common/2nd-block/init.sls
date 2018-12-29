{%- if salt['partition.get_block_device']()[1] == "sdb" -%}
caaaaa:
  cmd.run:
    - name: echo huyna
{% endif %}