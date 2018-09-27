minion_highstate:
  local.state.highstate:
    - tgt: {{ data['id'] }}

reboot:
  local.cmd.run:
    - tgt: {{ data['id'] }}
    - arg: reboot