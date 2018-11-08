LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

LOCAL_SRC_FILES := \
	delegation_client.c \
	delegation_client_extension.c \
	smc_properties.c \
	smc_properties_parser.c \
	lib_manifest2.c

LOCAL_CFLAGS += -DLINUX
LOCAL_CFLAGS += -D__ANDROID32__

ifdef S_VERSION_BUILD
LOCAL_CFLAGS += -DS_VERSION_BUILD=$(S_VERSION_BUILD)
endif

LOCAL_CFLAGS += -I $(LOCAL_PATH)/../tf_sdk/include/

LOCAL_MODULE:= tf_daemon
LOCAL_STATIC_LIBRARIES := libtee_client_api_driver
LOCAL_MODULE_TAGS := optional

ifeq ($(shell test $(PLATFORM_SDK_VERSION) -ge 26 || echo 1),)
LOCAL_PROPRIETARY_MODULE := true
endif

include $(BUILD_EXECUTABLE)
