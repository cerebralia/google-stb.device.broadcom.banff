export LOCAL_PRODUCT_OUT         := banff
export LOCAL_DEVICE_FULL_TREBLE  := y

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.default.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.banff
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.default.early:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.bcm
export LOCAL_DEVICE_FSTAB

export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default-sys-bloat.conf

LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.banff.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.banff.rc

# common to all banff devices.
include device/broadcom/banff/common.mk

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
# *** warning.
# $(call inherit-product, build/make/target/product/product_launched_with_m.mk)
# advertize launch with O to simplify certification testing (vts)
$(call inherit-product, build/make/target/product/product_launched_with_o.mk)
# *** warning.
PRODUCT_NAME                     := banff
PRODUCT_MODEL                    := banff
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := banff

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES += \
   ro.hardware=banff \
   \
   ro.opengles.version=196608 \
   debug.hwui.render_dirty_regions=false \
   ro.nx.mma=1 \
   \
   ro.nx.heap.video_secure=86m \
   ro.nx.heap.main=96m \
   ro.nx.heap.drv_managed=0m \
   ro.nx.heap.grow=8m \
   ro.nx.heap.shrink=2m \
   ro.nx.heap.gfx=72m \
   \
   ro.nx.capable.cb=1 \
   ro.nx.capable.si=1 \
   ro.sf.lcd_density=320 \
   \
   ro.rfkilldisabled=1 \
   ro.nx.eth.irq_mode_mask=3:2 \
   \
   ro.com.google.clientidbase=android-banff-tv \
   ro.nx.hwc2.tweak.force_eotf=0

TARGET_BOOTLOADER_BOARD_NAME := banff
