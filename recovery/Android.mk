# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifneq ($(filter arrow,$(TARGET_DEVICE)),)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := eng
LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := default_device.cpp

# should match TARGET_RECOVERY_UI_LIB set in BoardConfig.mk
LOCAL_MODULE := librecovery_ui_arrow

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES += bootable/recovery
LOCAL_SRC_FILES := recovery_updater.c

# should match TARGET_RECOVERY_UPDATER_LIBS set in BoardConfig.mk
LOCAL_MODULE := librecovery_updater_arrow

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

NXMINI := $(call intermediates-dir-for,EXECUTABLES,nxmini)/nxmini

EXTRA_SYSTEM_LIB_FILES := \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/drivers/fbdev/bcmnexusfb.ko \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/bcm_platform/brcm_nexus/bin/nexus.ko

ifeq ($(SAGE_SUPPORT),y)
EXTRA_SYSTEM_BIN_FILES := \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/bcm_platform/brcm_nexus/bin/sage_bl.bin \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/bcm_platform/brcm_nexus/bin/sage_bl_dev.bin \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/bcm_platform/brcm_nexus/bin/sage_os_app.bin \
   $(TOP)/${BCM_VENDOR_STB_ROOT}/bcm_platform/brcm_nexus/bin/sage_os_app_dev.bin
endif

define copy-recovery-extra-files
	@mkdir -p $(TARGET_ROOT_OUT)/system/bin
	@mkdir -p $(TARGET_ROOT_OUT)/system/lib
	@cp -f $(NXMINI) $(TARGET_ROOT_OUT)/sbin/
	@cp -f $(EXTRA_SYSTEM_LIB_FILES) $(TARGET_ROOT_OUT)/system/lib/
	@if [ "$(EXTRA_SYSTEM_BIN_FILES)" != "" ]; then \
		cp -f $(EXTRA_SYSTEM_BIN_FILES) $(TARGET_ROOT_OUT)/system/bin/; \
	fi
endef

.PHONY: recovery_bcm_libs

recovery_bcm_libs: $(NXMINI) \
		$(EXTRA_SYSTEM_LIB_FILES) \
		$(EXTRA_SYSTEM_BIN_FILES)
	$(hide) $(call copy-recovery-extra-files)

out/target/product/arrow/recovery.img : recovery_bcm_libs

endif
