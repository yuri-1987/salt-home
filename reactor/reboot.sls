reboot_minions:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - arg:
      - reboot