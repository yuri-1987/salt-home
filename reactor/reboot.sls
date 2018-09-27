reboot_minions:
  local.function:
    - tgt: {{ data['id'] }}
    - arg:
      - system.reboot