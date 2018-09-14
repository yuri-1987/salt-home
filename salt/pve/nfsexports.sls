nas_nfs_export:
  nfs_export.present:
{% for export in ['/mnt/nas/', '/mnt/backup/'] %}
    - name: {{ export }}
    - clients:
      - hosts: '192.168.1.0/24'
        options:
          - 'rw'
          - 'sync'
          - 'insecure'
          - 'no_subtree_check'
          - 'nohide'
          - 'all_squash'
          - 'anonuid=9001'
          - 'anongid=9001'
{% endfor %}

nfs-server:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - nfs_export: nas_nfs_export
