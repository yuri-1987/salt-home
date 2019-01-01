"{{saltenv}}":
  '*':
    - common

  'kube-*':
    - kube-configs
    - mines