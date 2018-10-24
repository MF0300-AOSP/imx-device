#
# Product-specific compile-time definitions.
#
include device/fsl/imx6/soc/imx6dq.mk
include device/fsl/mf0300_6dq/build_id.mk
include device/fsl/imx6/BoardConfigCommon.mk
ifeq ($(PREBUILT_FSL_IMX_CODEC),true)
-include $(FSL_CODEC_PATH)/fsl-codec/fsl-codec.mk
endif

# mf0300_6dq default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

# build for ext4
TARGET_RECOVERY_FSTAB = device/fsl/mf0300_6dq/fstab.freescale

# Vendor Interface Manifest
PRODUCT_COPY_FILES += \
    device/fsl/mf0300_6dq/manifest.xml:vendor/manifest.xml

TARGET_BOOTLOADER_BOARD_NAME := MF0300
PRODUCT_MODEL := MF0300-MX6DQ

TARGET_BOOTLOADER_POSTFIX := imx
TARGET_DTB_POSTFIX := -dtb

TARGET_RELEASETOOLS_EXTENSIONS := device/fsl/imx6
# UNITE is a virtual device.
BOARD_WLAN_DEVICE            := bcmdhd
WPA_SUPPLICANT_VERSION       := VER_0_8_X

BOARD_WPA_SUPPLICANT_DRIVER  := NL80211
BOARD_HOSTAPD_DRIVER         := NL80211

BOARD_HOSTAPD_PRIVATE_LIB               := lib_driver_cmd_bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB        := lib_driver_cmd_bcmdhd

WIFI_DRIVER_FW_PATH_STA        := "/vendor/firmware/bcm/GB86302I_BCM4330/fw_bcm4330b2_ag.bin"
WIFI_DRIVER_FW_PATH_P2P        := "/vendor/firmware/bcm/GB86302I_BCM4330/fw_bcm4330b2_ag.bin"
WIFI_DRIVER_FW_PATH_AP         := "/vendor/firmware/bcm/GB86302I_BCM4330/fw_bcm4330b2_ag_apsta.bin"
WIFI_DRIVER_FW_PATH_PARAM      := "/sys/module/bcmdhd/parameters/firmware_path"

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := true
SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_KERNEL_CMDLINE := \
	console=ttymxc3,115200 init=/init \
	video=mxcfb0:dev=ldb,fbpix=RGB32,bpp=32 video=mxcfb1:off video=mxcfb2:off video=mxcfb3:off \
	vmalloc=128M androidboot.console=ttymxc3 consoleblank=0 androidboot.hardware=freescale cma=448M galcore.contiguousSize=33554432

# Broadcom BCM4339 BT
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/fsl/mf0300_6dq/bluetooth

USE_ION_ALLOCATOR := true
USE_GPU_ALLOCATOR := false

# define frame buffer count
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

PHONE_MODULE_INCLUDE := true
# camera hal v3
IMX_CAMERA_HAL_V3 := true


#define consumer IR HAL support
IMX6_CONSUMER_IR_HAL := false

TARGET_KERNEL_DEFCONF := \
	imx_v7_mf0300_android_defconfig

TARGET_BOOTLOADER_CONFIG := \
	imx6q-mf0300-xga:mx6qmf0300android_xga_defconfig \
	imx6q-mf0300-wxga:mx6qmf0300android_wxga_defconfig \
	imx6q-mf0300-sdcardflasher:mx6qmf0300android_sdcardflasher_defconfig \
	imx6q-mf0300-mfg:mx6qmf0300android_mfg_defconfig

TARGET_BOARD_DTS_CONFIG := \
	imx6q-mf0300-xga:imx6q-mf0300-xga.dtb \
	imx6q-mf0300-wxga:imx6q-mf0300-wxga.dtb

BOARD_SEPOLICY_DIRS := \
       device/fsl/imx6/sepolicy \
       device/fsl/mf0300_6dq/sepolicy

# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
       device/fsl/mf0300_6dq/seccomp/mediacodec-seccomp.policy:vendor/etc/seccomp_policy/mediacodec.policy \
       device/fsl/mf0300_6dq/seccomp/mediaextractor-seccomp.policy:vendor/etc/seccomp_policy/mediaextractor.policy

PRODUCT_COPY_FILES += \
       device/fsl/mf0300_6dq/app_whitelist.xml:system/etc/sysconfig/app_whitelist.xml

TARGET_BOARD_KERNEL_HEADERS := device/fsl/common/kernel-headers
