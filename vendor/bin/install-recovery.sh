#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):67108864:e4ef534980dd0f2dc5d16a9c84006d5b2506eff8; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot$(getprop ro.boot.slot_suffix):134217728:595d7c235f48aabb15182ee9e7f8e9f94352018d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery$(getprop ro.boot.slot_suffix):67108864:e4ef534980dd0f2dc5d16a9c84006d5b2506eff8 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
