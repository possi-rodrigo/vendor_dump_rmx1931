#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:f9b7ead7e9c769469ba19cb305a0162ff8d91213; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:6d9194ac360ca640e1964247d122846f09c4307c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:f9b7ead7e9c769469ba19cb305a0162ff8d91213 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
