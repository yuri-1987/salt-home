reboot_minions:
  salt.function:
    - name: system.reboot
    - tgt: {{ data['id'] }}