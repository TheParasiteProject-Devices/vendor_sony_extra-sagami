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

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
   $(EXTRA_PATH)/extra/apps

# Sony Apps
PRODUCT_PACKAGES += \
    SomcColorGamut \
    SomcDualshockManager \
    SomcMediaExtensionProvider \
    ExternalMonitor \
    UsbExtOutAudio

# Sony Creator
ifeq ($(TARGET_SHIPS_SONY_CREATOR), true)
PRODUCT_PACKAGES += \
    MusicPro \
    MovieCreator \
    VideoCreator
endif

# Sony Music
ifeq ($(TARGET_SHIPS_SONY_MUSIC), true)
PRODUCT_PACKAGES += \
    SemcMusic
endif
