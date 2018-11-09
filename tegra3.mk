# Copyright (C) 2017 The Unlegacy Android Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TEGRA3_BASE := hardware/nvidia/tegra3

PRODUCT_PACKAGES += \
	libstagefrighthw \
	libtf_crypto_sst \
	tf_daemon

# libc_util used by proprietary binaries on android >= 8.0
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 || echo 1),)
PRODUCT_PACKAGES += \
	libc_util
endif

# Keystore
PRODUCT_PACKAGES += \
	keystore.tegra3 \
	android.hardware.keymaster@3.0-impl

# Power
PRODUCT_PACKAGES += \
	power.tegra3 \
	android.hardware.power@1.0-impl

# Graphics
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.graphics.mapper@2.0-impl

# Move tf_daemon to /vendor on android >= 8.0
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 || echo 1),)
PRODUCT_COPY_FILES += \
	$(TEGRA3_BASE)/rootdir/init.tegra3-o.rc:root/init.tegra3.rc \
	$(TEGRA3_BASE)/rootdir/init.tegra3.power.rc:root/init.tegra3.power.rc
else
PRODUCT_COPY_FILES += \
	$(TEGRA3_BASE)/rootdir/init.tegra3.rc:root/init.tegra3.rc \
	$(TEGRA3_BASE)/rootdir/init.tegra3.power.rc:root/init.tegra3.power.rc
endif

# Seccomp policy
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 || echo 1),)
PRODUCT_COPY_FILES += \
	$(TEGRA3_BASE)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
	$(TEGRA3_BASE)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy
endif

PRODUCT_PROPERTY_OVERRIDES += \
	debug.hwui.render_dirty_regions=false \
	persist.tegra.nvmmlite=1 \
	ro.opengles.version=131072 \
	ro.zygote.disable_gl_preload=true \
	sys.max_texture_size=2048 \
	persist.media.treble_omx=false

$(call inherit-product-if-exists, vendor/nvidia/tegra3/nvidia-vendor.mk)

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 20 || echo 1),)
$(call inherit-product-if-exists, vendor/widevine/arm-generic/widevine-vendor.mk)
else
$(call inherit-product-if-exists, vendor/widevine/tegra3/widevine-vendor.mk)
endif
