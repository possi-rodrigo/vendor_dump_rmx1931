#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:83886080:0cfb98671ef66cbe45f7c47a8848a3573bab78df; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:1b7562d1b4a0af5872dd1e900baacf5e565d51cc \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:83886080:0cfb98671ef66cbe45f7c47a8848a3573bab78df && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
