# Copyright (C) 2017 The Unlegacy Android Project
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

TEGRA3_BASE := hardware/nvidia/tegra3

PRODUCT_PACKAGES += \
	keystore.tegra3 \
	libstagefrighthw \
	libtf_crypto_sst \
	power.tegra3 \
	tf_daemon

PRODUCT_COPY_FILES += \
	$(TEGRA3_BASE)/rootdir/init.tegra3.rc:root/init.tegra3.rc \
	$(TEGRA3_BASE)/rootdir/init.tegra3.power.rc:root/init.tegra3.power.rc

$(call inherit-product-if-exists, vendor/nvidia/tegra3/nvidia-vendor.mk)
