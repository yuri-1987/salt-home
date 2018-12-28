"{{saltenv}}":
  '*':
    - minion

  'salt.local.lan':
    - master

  'vdr.local.lan':
    - vdr

  'pve.local.lan':
    - pve

  'kube-*':
    - k8s-certs
    - k8s-master
    - k8s-worker