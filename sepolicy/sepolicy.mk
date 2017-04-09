TEGRA3_SEPOLICY_BASE := hardware/nvidia/tegra3/sepolicy

# 4.4
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -eq 19 || echo 1),)
BOARD_SEPOLICY_UNION += \
	app.te \
	device.te \
	drmserver.te \
	file.te \
	file_contexts \
	init.te \
	surfaceflinger.te \
	system_app.te \
	ueventd.te
endif

# 6.0
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -eq 23 || echo 1),)
BOARD_SEPOLICY_DIRS += $(TEGRA3_SEPOLICY_BASE)/compat/mm
endif

# >=7.1
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 24 || echo 1),)
BOARD_SEPOLICY_M4DEFS += android_api_mm_or_later=true
BOARD_SEPOLICY_M4DEFS += android_api_n_or_later=true
endif

BOARD_SEPOLICY_DIRS += $(TEGRA3_SEPOLICY_BASE)
