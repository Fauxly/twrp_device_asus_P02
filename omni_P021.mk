#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from P021 device
$(call inherit-product, device/asus/P021/device.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/omni/config/gsm.mk)


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/asus/P021/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := P021
PRODUCT_NAME := omni_P021
PRODUCT_BRAND := asus
PRODUCT_MODEL := P021
PRODUCT_MANUFACTURER := asus
PRODUCT_RELEASE_NAME := asus P021

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=P021 \
    PRODUCT_NAME=WW_P021 \
    PRIVATE_BUILD_DESC="WW_P021-user 5.0.2 LRX22G WW_P021-V4.6.2-20160126 release-keys"

BUILD_FINGERPRINT := asus/WW_P021/P021:5.0.2/LRX22G/WW_P021-V4.6.2-20160126:user/release-keys

