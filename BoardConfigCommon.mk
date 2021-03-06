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

TARGET_BOARD_PLATFORM := tegra3
TARGET_BOARD_PLATFORM_VARIANT := tegra3-next

# Processor
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

# Graphics
SF_START_GRAPHICS_ALLOCATOR_SERVICE := true

# Security
BOARD_USES_SECURE_SERVICES := true
include $(TEGRA3_BASE)/sepolicy/sepolicy.mk
