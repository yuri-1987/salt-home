reboot_minions:
  local.salt.function:
    - name: system.reboot
    - tgt: {{ data['id'] }}