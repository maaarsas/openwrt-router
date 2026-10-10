# openwrt-router

OpenWrt config for a TP-Link Archer AX23, kept as code.

`config/` holds the router's `/etc/config/` files. Wi-Fi names and passwords
are `@placeholders@`; real values live on the router in `/etc/openwrt-router.env`.

## Install

Connect to the router with a LAN cable, then: 

    ssh root@192.168.1.1

After connecting to the router, execute these commands:

    passwd
    wget -O- https://github.com/maaarsas/openwrt-router/archive/refs/heads/main.tar.gz | tar -xz -C /tmp
    cp /tmp/openwrt-router-main/secrets.env.example /etc/openwrt-router.env
    chmod 600 /etc/openwrt-router.env
    echo /etc/openwrt-router.env >> /etc/sysupgrade.conf
    vi /etc/openwrt-router.env
    /tmp/openwrt-router-main/install.sh

In `/etc/openwrt-router.env`, quote values with spaces (`WIFI_SSID='My Home'`).
Don't use `'`, `|`, `&` or `\` in values.

`passwd` sets the root password for ssh and the web dashboard. A fresh or reset
router has none. It lives in `/etc/shadow`, so `install.sh` doesn't touch it.

The repo is unpacked to `/tmp` (RAM) because the router's flash is too small
for git. Adding the env file to `/etc/sysupgrade.conf` keeps it across firmware
upgrades.

## Update

After pushing changes to GitHub, on the router:

    rm -rf /tmp/openwrt-router-main
    wget -O- https://github.com/maaarsas/openwrt-router/archive/refs/heads/main.tar.gz | tar -xz -C /tmp
    /tmp/openwrt-router-main/install.sh

