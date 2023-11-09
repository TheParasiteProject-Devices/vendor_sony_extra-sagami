#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifneq ($(TARGET_SONY_EXTRA_PATH),)
EXTRA_PATH := $(TARGET_SONY_EXTRA_PATH)
else
EXTRA_PATH := vendor/sony/extra
endif

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(EXTRA_PATH)

# Flags
TARGET_SHIPS_SONY_FRAMEWORK ?= true
TARGET_SHIPS_SONY_CAMERA ?= true
TARGET_SHIPS_SONY_APPS ?= true
TARGET_SHIPS_SOUND_ENHANCEMENTS ?= true
TARGET_SUPPORTS_GAME_CONTROLLERS ?= true

# Sony Framework
ifeq ($(TARGET_SHIPS_SONY_FRAMEWORK),true)
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(EXTRA_PATH)/extra/framework/system/,$(TARGET_COPY_OUT_SYSTEM)/) \
    $(call find-copy-subdir-files,*,$(EXTRA_PATH)/extra/framework/system_ext/,$(TARGET_COPY_OUT_SYSTEM_EXT)/) \
    $(call find-copy-subdir-files,*,$(EXTRA_PATH)/extra/framework/product/,$(TARGET_COPY_OUT_PRODUCT)/)
endif

ifeq ($(TARGET_SHIPS_SONY_CAMERA), true)
# Sony Camera
    $(call inherit-product, $(EXTRA_PATH)/extra/camera/camera.mk)
endif

# Sony Apps
ifeq ($(TARGET_SHIPS_SONY_APPS),true)
    $(call inherit-product, $(EXTRA_PATH)/extra/apps/apps.mk)
endif

# Sound Enhancements
ifeq ($(TARGET_SHIPS_SOUND_ENHANCEMENTS),true)
    $(call inherit-product, $(EXTRA_PATH)/extra/audio/dolby/dolby.mk)
endif

# Game Controllers
ifeq ($(TARGET_SUPPORTS_GAME_CONTROLLERS),true)
 PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(EXTRA_PATH)/extra/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)
endif
