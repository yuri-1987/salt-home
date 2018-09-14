/mnt/nas:
  mount.mounted:
    - device: UUID=9ae3aa64-359d-46db-a9da-45e1dcdd15e6
    - fstype: ext4
    - opts: errors=remount-ro
    - dump: 0
    - pass_num: 1
    - persist: True
    - mkmnt: True