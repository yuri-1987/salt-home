kubernetes:
  version: v1.11.5
  domain: cluster.local
  master:
    count: 3
    cluster:
      node01:
        hostname: kube-node-01.local.lan
        ipaddr: 192.168.1.172
      node02:
        hostname: kube-node-01.local.lan
        ipaddr: 192.168.1.176
      node03:
        hostname: kube-node-01.local.lan
        ipaddr: 192.168.1.170
    encryption-key: 'w3RNESCMG+o3GCHTUcrQUUdq6CFV72q/Zik9LAO8uEc='
    etcd:
      version: v3.3.10
  worker:
    runtime:
      provider: docker
      docker:
        version: 18.06.0-ce
        data-dir: /var/lib/docker
    networking:
      cni-version: v0.7.1
      provider: calico
      calico:
        version: v3.2.4
        cni-version: v3.2.4
        calicoctl-version: v3.2.4
        controller-version: 3.2-release
        as-number: 64512
        token: hu0daeHais3aCHANGEMEhu0daeHais3a
        ipv4:
          range: 10.64.0.0/16
          nat: true
          ip-in-ip: true
        ipv6:
          enable: false
          nat: true
          interface: eth0
          range: fd80:24e2:f998:72d6::/64
  global:
    clusterIP-range: 10.32.0.0/16
    helm-version: v2.12.1
    dashboard-version: v1.10.0
    admin-token: Haim8kay1rarCHANGEMEHaim8kay11ra
    kubelet-token: ahT1eipae1wiCHANGEMEahT1eipa1e1w
