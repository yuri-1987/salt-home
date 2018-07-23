minion_highstate:
  local.state.highstate:
    - tgt: {{ data['id'] }}