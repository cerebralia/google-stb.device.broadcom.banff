# mandatory device configuration.
export NEXUS_PLATFORM            := 97439
export BCHP_VER                  := B0
export NEXUS_USE_7439_SFF        := y
export PLATFORM                  := 97439
export ANDROID_PRODUCT_OUT       := banff

# compile the rc's for the device.
LOCAL_DEVICE_RCS                 := device/broadcom/common/rcs/init.rc:root/init.banff.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.nx.rc:root/init.nx.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/ueventd.rc:root/ueventd.banff.rc
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.fs.default.rc:root/init.fs.rc  # NOT verity
LOCAL_DEVICE_RCS                 += device/broadcom/common/rcs/init.eth.eth0.rc:root/init.eth.rc   # uses 'eth0'
LOCAL_DEVICE_RCS                 += device/broadcom/banff/rcs/init.block.rc:root/init.block.rc   # block devices
LOCAL_DEVICE_RCS                 += device/broadcom/banff/rcs/init.bcm.usb.rc:root/init.bcm.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RCS

LOCAL_DEVICE_RECOVERY_RCS        := device/broadcom/common/rcs/init.recovery.rc:root/init.recovery.banff.rc
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/banff/rcs/init.block.rc:root/init.recovery.block.rc   # block devices
LOCAL_DEVICE_RECOVERY_RCS        += device/broadcom/banff/rcs/init.recovery.usb.rc:root/init.recovery.usb.rc   # uses 'configfs'
export LOCAL_DEVICE_RECOVERY_RCS

LOCAL_DEVICE_FSTAB               := device/broadcom/common/fstab/fstab.default:root/fstab.banff
LOCAL_DEVICE_FSTAB               += device/broadcom/common/fstab/fstab.default:root/fstab.bcm
export LOCAL_DEVICE_FSTAB

LOCAL_DEVICE_RECOVERY_FSTAB      := device/broadcom/common/recovery/fstab.default/recovery.fstab
export LOCAL_DEVICE_RECOVERY_FSTAB

# compile the media codecs for the device.
LOCAL_DEVICE_MEDIA               := device/broadcom/common/media/media_codecs_no_enc.xml:system/etc/media_codecs.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_profiles.xml:system/etc/media_profiles.xml
LOCAL_DEVICE_MEDIA               += device/broadcom/common/media/media_codecs_performance_no_enc.xml:system/etc/media_codecs_performance.xml
export LOCAL_DEVICE_MEDIA

# optional device override/addition.
export LOCAL_DEVICE_OVERLAY      := device/broadcom/banff/overlay
export LOCAL_DEVICE_SEPOLICY_BLOCK := device/broadcom/banff/sepolicy-block
export LOCAL_DEVICE_AON_GPIO     := device/broadcom/banff/aon_gpio.cfg:system/vendor/power/aon_gpio.cfg
export LOCAL_DEVICE_KEY_POLL     := device/broadcom/common/keylayout/gpio_keys_polled.kl:system/usr/keylayout/gpio_keys_polled_5.kl
export LOCAL_DEVICE_REFERENCE_BUILD := device/broadcom/banff/reference_build.mk
export LOCAL_DEVICE_BT_CONFIG    := device/broadcom/banff/bluetooth/vnd_banff.txt
export LOCAL_DEVICE_USERDATA     := 6137298432 # ~5.7G
export LOCAL_DEVICE_GPT          := device/broadcom/common/gpts/default.conf
export V3D_VARIANT               := vc5

# kernel command line.
LOCAL_DEVICE_KERNEL_CMDLINE      := mem=2048m@0m
LOCAL_DEVICE_KERNEL_CMDLINE      += bmem=534m@1506m
LOCAL_DEVICE_KERNEL_CMDLINE      += brcm_cma=736m@768m
LOCAL_DEVICE_KERNEL_CMDLINE      += ramoops.mem_address=0x7F800000 ramoops.mem_size=0x800000 ramoops.console_size=0x400000 pmem=8m@2040m
export LOCAL_DEVICE_KERNEL_CMDLINE

# baseline the common support.
$(call inherit-product, device/broadcom/common/bcm.mk)
PRODUCT_NAME                     := banff
PRODUCT_MODEL                    := banff
PRODUCT_BRAND                    := google
PRODUCT_DEVICE                   := banff

# additional setup per device.
ADDITIONAL_DEFAULT_PROPERTIES    += ro.hardware=banff
ADDITIONAL_DEFAULT_PROPERTIES    += ro.product.board=banff

