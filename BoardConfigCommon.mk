# inherit from the proprietary version
-include vendor/oppo/find7a/BoardConfigVendor.mk

COMMON_PATH := device/oppo/msm8974-common

TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT := krait
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.selinux=permissive androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE :=  0x80200000
#BOARD_FORCE_RAMDISK_ADDRESS := 0x05000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
BOARD_CUSTOM_BOOTIMG_MK := $(COMMON_PATH)/mkbootimg.mk

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00F00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00F00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1388314624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 3221225472
BOARD_FLASH_BLOCK_SIZE := 131072

# global
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP

# Display
TARGET_QCOM_DISPLAY_VARIANT := caf-bfam
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
TARGET_USES_C2D_COMPOSITION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Time Daemon
BOARD_USES_QC_TIME_SERVICES := true

# Audio/media
BOARD_USES_ALSA_AUDIO:= true
TARGET_QCOM_AUDIO_VARIANT := caf-bfam
AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true
AUDIO_FEATURE_DISABLED_FM := true
AUDIO_FEATURE_DISABLED_MULTI_VOICE_SESSIONS := true
TARGET_QCOM_MEDIA_VARIANT := caf-bfam

# Camera
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DOPPO_CAMERA_HARDWARE
USE_DEVICE_SPECIFIC_CAMERA := true

# Disable secure discard because it's SLOW
BOARD_SUPPRESS_SECURE_ERASE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

BOARD_EGL_CFG := $(COMMON_PATH)/configs/egl.cfg

# Compatibility with pre-kitkat Qualcomm sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

#TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun%d/file

# Recovery:Start

# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true

# TWRP specific build flags
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_NO_USB_STORAGE := true
TW_INCLUDE_JB_CRYPTO := true
TW_NO_SCREEN_BLANK := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
