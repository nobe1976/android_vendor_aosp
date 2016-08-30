
# Include overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay/common

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/bin/sysinit:system/bin/sysinit

# PureNexus-specific init file
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/etc/init.local.rc:root/init.local.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/bin/50-base.sh:system/addon.d/50-base.sh \

# Security Enhanced Linux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Main Required Packages
PRODUCT_PACKAGES += \
    Launcher3 \
    LiveWallpapersPicker

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

# Allow tethering without provisioning app
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter aosp_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# Camera Effects for devices without a vendor partition
ifneq ($(filter aosp_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/aosp/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif
