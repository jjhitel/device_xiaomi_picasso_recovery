#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
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

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := picasso

# Bootloader
PRODUCT_PLATFORM := sm7250
TARGET_BOOTLOADER_BOARD_NAME := lito
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := sm7250
TARGET_BOARD_PLATFORM_GPU := qcom-adreno620
QCOM_BOARD_PLATFORMS += sm7250

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=2048 cgroup.memory=nokmem,nosocket loop.max_part=7 androidboot.usbconfigfs=true androidboot.selinux=permissive androidboot.boot_devices=soc/1d84000.ufshc
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE          := 0x00000000
BOARD_KERNEL_TAGS_OFFSET   := 0x00000100
BOARD_KERNEL_OFFSET        := 0x00008000
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_RAMDISK_OFFSET       := 0x01000000
BOARD_DTB_OFFSET           := 0x01f00000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_MKBOOTIMG_ARGS += --base $(BOARD_KERNEL_BASE)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Kenel dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Kenel recovery dtbo
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9122611200
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product vendor system odm

# System as root
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_METADATA_PARTITION := true

# TWRP specific build flags
TW_DEVICE_VERSION := 3 by hadenix & masemoel   # Set Developers
TW_THEME := portrait_hdpi                      # Device resolution
BOARD_HAS_NO_REAL_SDCARD := true               # Disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
RECOVERY_SDCARD_ON_DATA := true                # this enables proper handling of /data/media on devices that have this folder for storage
TARGET_RECOVERY_QCOM_RTC_FIX := true           # This one is mainly to fix the wrong time and date
TW_EXCLUDE_DEFAULT_USB_INIT := true            # Don't include default init.recovery.usb.rc, provide your own or use needed defines inside init.recovery.$DEVICE.rc
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"                # blacklists an input device that interrupts touch processing
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness" # Path to the sysfs entry which controls the brightness
TW_MAX_BRIGHTNESS := 2047                      # Configurable maximum brightness
TW_DEFAULT_BRIGHTNESS := 1200                  # Set custom brightness, low is better
TWRP_INCLUDE_LOGCAT := true                    # Include LogCat Binary
TARGET_USES_LOGD := true                       # Fix up logd make file rules
TARGET_USES_MKE2FS := true                     # For better file system stability and a dropped forced check that occurs on every boot, use the new ext4 generation tool
#TW_HAS_EDL_MODE := true                       # Does not work / Booting into EDL Mode 
TW_USE_LEDS_HAPTICS := true                    # Support haptics drivers registered with LED class framework
TW_NO_USB_STORAGE := true                      # Removes USB Storage capability
TW_NO_SCREEN_BLANK := true                     # Turn on the screen on touch
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true # Replacing the folder name "serial_number" in the path for backup files, with "phone model"

# Languages
TW_EXTRA_LANGUAGES := true                     # Extended list of languages
TW_DEFAULT_LANGUAGE := en                      # Set Default Language

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

# If build on minimal-manifest sources
ALLOW_MISSING_DEPENDENCIES=true
TARGET_SUPPORTS_64_BIT_APPS := true            # Adding 64-bit applications to fix the build error
TARGET_USES_64_BIT_BINDER := true              # Remove if the device is 32-bit
