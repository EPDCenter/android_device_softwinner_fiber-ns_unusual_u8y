$(call inherit-product, device/softwinner/fiber-common/fiber-common.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# init.rc, kernel
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-ns/kernel:kernel \
	device/softwinner/fiber-ns/modules/modules/nand.ko:root/nand.ko \
	device/softwinner/fiber-ns/init.sun6i.rc:root/init.sun6i.rc \
	device/softwinner/fiber-ns/ueventd.sun6i.rc:root/ueventd.sun6i.rc \
	device/softwinner/fiber-ns/initlogo.rle:root/initlogo.rle  \
	device/softwinner/fiber-ns/media/bootanimation.zip:system/media/bootanimation.zip \
	device/softwinner/fiber-ns/media/bootlogo.bmp:system/media/bootlogo.bmp \
	device/softwinner/fiber-ns/media/initlogo.bmp:system/media/initlogo.bmp \
	device/softwinner/fiber-ns/fstab.sun6i:root/fstab.sun6i \
	device/softwinner/fiber-ns/init.recovery.sun6i.rc:root/init.recovery.sun6i.rc \
	device/softwinner/fiber-ns/init.sun6i.usb.rc:root/init.sun6i.usb.rc

# wifi features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml 

# touch screen
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# usb accessory
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# usb host
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

#extra
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# GPU buffer size configs
PRODUCT_COPY_FILES += \
        device/softwinner/fiber-ns/configs/powervr.ini:system/etc/powervr.ini

#key and tp config file
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-ns/configs/sw-keyboard.kl:system/usr/keylayout/sw-keyboard.kl \
	device/softwinner/fiber-ns/configs/tp.idc:system/usr/idc/tp.idc \
	device/softwinner/fiber-ns/configs/gsensor.cfg:system/usr/gsensor.cfg

#copy touch and keyboard driver to recovery randisk
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-ns/modules/modules/sw-keyboard.ko:obj/keyboard.ko \
    device/softwinner/fiber-ns/modules/modules/disp.ko:obj/disp.ko \
    device/softwinner/fiber-ns/modules/modules/lcd.ko:obj/lcd.ko \
    device/softwinner/fiber-ns/modules/modules/hdmi.ko:obj/hdmi.ko \
  device/softwinner/fiber-ns/modules/modules/gt9xx.ko:obj/gt9xx.ko \
  device/softwinner/fiber-ns/modules/modules/ft5x_ts.ko:obj/ft5x_ts.ko \
  device/softwinner/fiber-ns/modules/modules/gslX680.ko:obj/gslX680.ko \
  device/softwinner/fiber-ns/modules/modules/sw_device.ko:obj/sw_device.ko
# wifi & bt config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml
#recovery config
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-ns/recovery.fstab:recovery.fstab 
# camera
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-ns/configs/camera.cfg:system/etc/camera.cfg \
	device/softwinner/fiber-ns/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/softwinner/fiber-ns/configs/cfg-AWGallery.xml:system/etc/cfg-AWGallery.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml

# 3G Data Card Packages
PRODUCT_PACKAGES += \
	Bluetooth \
	u3gmonitor \
	chat \
	rild \
	pppd \
	Music \
	Launcher2

# 3G Data Card Configuration Flie
PRODUCT_COPY_FILES += \
	device/softwinner/fiber-common/rild/ip-down:system/etc/ppp/ip-down \
	device/softwinner/fiber-common/rild/ip-up:system/etc/ppp/ip-up \
	device/softwinner/fiber-common/rild/3g_dongle.cfg:system/etc/3g_dongle.cfg \
	device/softwinner/fiber-common/rild/usb_modeswitch:system/bin/usb_modeswitch \
	device/softwinner/fiber-common/rild/call-pppd:system/xbin/call-pppd \
	device/softwinner/fiber-common/rild/usb_modeswitch.sh:system/xbin/usb_modeswitch.sh \
	device/softwinner/fiber-common/rild/libsoftwinner-ril.so:system/lib/libsoftwinner-ril.so \
	device/softwinner/fiber-ns/rild/apns-conf.xml:system/etc/apns-conf.xml

# 3G Data Card usb modeswitch File
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/softwinner/fiber-common/rild/usb_modeswitch.d,system/etc/usb_modeswitch.d)

#copy preinstall apk and library
PRODUCT_COPY_FILES += \
	$(call find-copy-subdir-files,*,device/softwinner/fiber-ns/prebuild/apk,system/app) \
	$(call find-copy-subdir-files,*,device/softwinner/fiber-ns/prebuild/preinstallapk,system/preinstall) \
	$(call find-copy-subdir-files,*,device/softwinner/fiber-ns/prebuild/apklib,system/lib)
	
	
#4KPlayer
PRODUCT_COPY_FILES += \
       device/softwinner/fiber-ns/configs/cfg-fourkplayer.xml:system/etc/cfg-fourkplayer.xml

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Brussels \
	persist.sys.language=es \
	persist.sys.country=ES \

# a31st logger
PRODUCT_COPY_FILES += \
       device/softwinner/fiber-ns/tools/logger.sh:system/bin/logger.sh \
       device/softwinner/fiber-ns/tools/memtester:system/bin/memtester

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage\
	ro.udisk.lable=u8y \
	ro.font.scale=1.0
	

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	ro.sf.showhdmisettings=6
	

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    ro.wifi.usb=true \
    ro.setupwizard.mode=ENABLED 

$(call inherit-product-if-exists, device/softwinner/fiber-ns/modules/modules.mk)
include device/softwinner/fiber-common/prebuild/google/products/gms.mk
include device/softwinner/fiber-common/prebuild/framework_aw/framework_aw.mk

DEVICE_PACKAGE_OVERLAYS := \
    device/softwinner/fiber-ns/overlay \
    $(DEVICE_PACKAGE_OVERLAYS)

PRODUCT_CHARACTERISTICS := tablet

# Overrides
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi large
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_BRAND  := Unusual
PRODUCT_NAME   := fiber_ns
PRODUCT_DEVICE := fiber-ns
PRODUCT_MODEL  := Unusual u8y

