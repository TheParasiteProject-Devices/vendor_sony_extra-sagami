DOLBY_CUSTOM_PATH := $(EXTRA_PATH)/extra/audio/dolby/custom

# DaxUI
PRODUCT_PACKAGES += \
    DaxUI

# Configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DOLBY_CUSTOM_PATH)/configs/permissions/,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions) \
    $(call find-copy-subdir-files,*,$(DOLBY_CUSTOM_PATH)/configs/sysconfig/,$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig)
