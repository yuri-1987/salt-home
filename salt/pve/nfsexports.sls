nas_nfs_export:
  nfs_export.present:
    - name: '/mnt/nas/'
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

backup_nfs_export:
  nfs_export.present:
    - name: '/mnt/backup/'
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

nfs-server:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/exports