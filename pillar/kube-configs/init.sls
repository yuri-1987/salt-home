#!jinja|yaml|gpg
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
        hostname: kube-node-02.local.lan
        ipaddr: 192.168.1.176
      node03:
        hostname: kube-node-03.local.lan
        ipaddr: 192.168.1.170
    encryption-key: |
        -----BEGIN PGP MESSAGE-----

        hQEMA8eD0o0hSHg+AQf/SpRg9iFtFHKZkcQR9QK3Aa45SPiVsY+CTG2UKcuKk4Po
        7tHl/c3wT7TUzmqpVZYTw6fWelW9ENgik6BXhy6bDma8e7HGqkTG0lO5l9Kr5OtT
        OO0z9jaxhYtJRLKbzTIuqbjQnSSDmJumJJ40uONzC3xpFL6/gFYcd+Q59Ta51ui+
        IY2tlIdNuVzXD30CmRM311FO5NEZA73M3Fi+IEBNg6qwefzF2EytJWTzXw1xawcD
        nQtUOf6kU7ufLHBzFqLbl2ass6CESYkxvtwceXQsr9vljpJp0ImiWt9XmXfKDNp4
        xXkA4Bso02hdX2nWBQmc+qQr8eCd/GjtBuO3edctkdJnAYQY3KugMumZASdbNR0L
        Et1lsbOZgtiSvbB4agQNkOAFo03rnorMhdxgklxaHnJq82H2jVJFFwPhbE4vyVX0
        j/rBSkR6q6Ffk6yYeBCFHpaFVM34c3giN71G08424YWz+UYfs3Mv7g==
        =yfGb
        -----END PGP MESSAGE-----
    etcd:
      version: v3.3.10
    secrets:
      
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
        token: |
            -----BEGIN PGP MESSAGE-----

            hQEMA8eD0o0hSHg+AQf/QjF58ZILAw9I0Qx5kvcjrRFBaMEupMm12dF/GSTXd0Tq
            Z7pcwFOaX8ezWA4QVPyUDJdKCP7kAlZA2eBG06ZgAICCPViKE+sc6Y0rSrrVXnd1
            kfv9ysTw+wkEXS8xMvcMywkRE5fxSeBSbw7GJZF4cMqvIGQmQ7o1vMSi5ujlF/QZ
            LsKwQdFg9BeXtQAM3LwmtoR/Oo5y1zImA/A9/Sznhc+LaoIjb+AqxQrfeaegfz7x
            XVes4dGoAolByW5qz5sRxAQNXi15ymHeICdhTIuTx5Uyan34kLe3Aev2U9UU7KWG
            3l3Jl1dUkhhxSd90G5f1dEmocY/ybb7FAD/1ejZdnNJbAVtPBcRR/MF9kp6vmeoP
            YDz54zu9KYrrrAruGUkUbgyD24schtEFTIySL9nygw6PH2/kwMi8s4N/mXMh7fQc
            1774yQFxPcG1NGJLiAgGLGVmLOz1m0SZ8y4ubw==
            =/RA9
            -----END PGP MESSAGE-----
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
    admin-token: |
        -----BEGIN PGP MESSAGE-----

        hQEMA8eD0o0hSHg+AQf6Aj6N+y89ypoz8m4xrPr8608xlGvM1iMipsdMyiCnRQpu
        i1YaJnt7LCuHYRKpURVvpDZldTZwtn5+HgZ8o5UOdELNQJb6UZK5Bqck5PDJ5hD0
        Nch4OJY8rWQENAc+lhTniC/TJrIan9RnjYh1HUMxdKECU9jMZU/kraVlVAtyNjKd
        0I63vuwkTw+PnvOi/2lWDcTr4rz5Nrql9YzTg6XxYDiK71dusqHrw/XLLcomT7rR
        xXMLqZOU7bTvw2weSWfcSFok6LwO76woeR7z73F3iyUAmjft57NbKMXhDmf/N71x
        4ATknh+ppwjgoXAGguAUWoDxogXND2/A4nSxWGlDwtJbAUiWK1NGaRCtTrsq00ZU
        2UNFwwEfnDLL/uNO4unD443U9az2Jn7S3zol6GN6HsihBY3SqgiIxSSRxbSdriZY
        HJNJv9DboyL7A7ZTYrvzhlS9a1/3JdVIXsIaCA==
        =4LFH
        -----END PGP MESSAGE-----
    kubelet-token: |
        -----BEGIN PGP MESSAGE-----

        hQEMA8eD0o0hSHg+AQgAgMTymrWg9/pBWkpDzfmPXM/XOAVEJF1/XDr9Bx0YgA+b
        qi2l4NKxuWDsbarR7SrP4kJOQ4DipknMbKML6xZz93yXDk5Z8YTg6YXdS1Y41LDH
        g6FUmaB13cYR5p/2d7NvJvgCXKIaRgT/sG+9zmLriDBV4fFGcUR69S5GLIgxJ3li
        Xbk77+OmpRREwnsI3jStphlozz8sMCrHoso/U9+EaruS2NUsfgb6rJr33l2WjGIY
        l/6rqOlEYaZVRyy7ncfQzwvrWmqqUNwO0fgune3q/xLlltxBcvuoqPFkaORxEnuw
        KQ06tk+Ne4ZbGIZrucffwd00p2G8gv2xILFSaC2O/dJbAROU2Pe3nFo5pe31PKPJ
        v31delIFLsYQqxsV3ndje6RRyE/7YqcBcRsQoY/PbrKe+rbiTZX4WhH2jTpARzDZ
        qXU0L4V0HtO5Q+er2Nl91uZOS7Dlolt0++XA4w==
        =bJOr
        -----END PGP MESSAGE-----