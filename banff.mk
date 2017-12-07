export ANDROID_PRODUCT_OUT       := banff

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.default.early:root/fstab.banff
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.default.early:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default.conf

LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.banff.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.banff.rc

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.banff.rc

# common to all banff devices.
include device/broadcom/banff/common.mk

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
$(call inherit-product, build/make/target/product/product_launched_with_m.mk)
PRODUCT_NAME                     := banff
PRODUCT_MODEL                    := banff
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := banff

# additional setup per device.
PRODUCT_PROPERTY_OVERRIDES    += ro.hardware=banff
TARGET_BOOTLOADER_BOARD_NAME := banff

