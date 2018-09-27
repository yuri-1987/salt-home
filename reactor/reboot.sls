reboot_minions:
  local.cmd.run:
    - tgt: {{ data['name'] }}
    - arg:
      - reboot