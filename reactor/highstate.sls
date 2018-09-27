minion_highstate:
  local.state.highstate:
    - tgt: {{ data['id'] }}

reboot:
  local.module.run:
    - tgt: {{ data['id'] }}
    - arg: system.reboot