TWRP device tree for Xiaomi Redmi K30 5G

## Features

Works:

- ADB
- Decryption of /data (It does not work on custom ROM, it is associated with non-augmented files for the vendor that are responsible for decryption)
- Screen brightness settings
- Correct screenshot color
- MTP
- Flashing (opengapps, roms, images and so on)
- Backup/Restore (Needs more testing)
- USB OTG
- Vibration support

# How to build
Download TWRP's source and picasso's repos. Your local manifest should be something like:

```bash
<?xml version="1.0" encoding="UTF-8"?>
<manifest>

<!-- Device tree -->
  <project name="Redmi-K30-5G/device_xiaomi_picasso_recovery" path="device/xiaomi/picasso" remote="github" revision="android-10.0_twrp"/>

</manifest>
```

Then go to the source folder and run:

```bash
. build/envsetup.sh && lunch omni_picasso-eng
export LC_ALL=C
mka recoveryimage
```

# Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
Network	| GSM (B2/B3/B5/B8) / HSPA (B1/B2/B5/B8) / LTE (B1/B3/B5/B7/B8, B34/B38/B39/B40/B41) / NR (n41/n78)
SIM Slots | Dual Nano SIM card capability
Launch	| 2020, January
SoC     | Qualcomm Snapdragon 765G
CPU     | Octa-core (1x2.4 GHz Kryo 475 Prime & 1x2.2 GHz Kryo 475 Gold & 6x1.8 GHz Kryo 475 Silver)
GPU     | Adreno 620
Memory  | 6/8 GB RAM
Shipped Android Version | 10 with MIUI 11
Storage | 64/128/256 GB (without SD card slot)
Battery | Non-removable Li-Po 4500 mAh battery
Display | 1080 x 2400 pixels, 20:9 ratio, 6.67 inches, 120hz, HDR10, IPS LCD (~386 ppi density), Gorilla Glass 5
Weight  | 208 grams
Back cameras   | 64.0MP (main) + 8.0MP (wide) + 5.0MP (macro) + 2.0MP (portrait), LED flash, 2160p@30fps or 1080p@60fps
Front cameras  | 20.0MP (main) +2.0MP (portrait), 1080p@30fps
WLAN  | Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi Direct, dual band, hotspot
Bluetooth  | v5.1 A2DP, LE, aptX HD
GPS	    | Yes, with A-GPS, GLONASS, BDS, GALILEO
NFC	    | Yes
Radio   | FM radio
USB	    | C-type 2.0 with fast charge up to 30 W, OTG
Colors 	| Blue, purple, red or white
Sensors | Fingerprint ID with the power button, infrared, 3.5mm jack

![Xiaomi Redmi K30 5G](https://cdn.cnbj0.fds.api.mi-img.com/b2c-shopapi-pms/pms_1575882160.38569692.jpg "Xiaomi Redmi K30 5G")
