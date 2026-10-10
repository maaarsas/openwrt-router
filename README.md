# openwrt-router

OpenWrt config for a TP-Link Archer AX23, kept as code.

`config/` holds the router's `/etc/config/` files. Wi-Fi names and passwords
are `@placeholders@`; real values live in the git-ignored `secrets.env`.

## Install

Connect to the router with a LAN cable (applying Wi-Fi changes drops Wi-Fi
clients), then on the router (`ssh root@192.168.1.1`):

    apk add git git-http
    git clone https://github.com/maaarsas/openwrt-router.git
    cd openwrt-router
    cp secrets.env.example secrets.env
    vi secrets.env    # fill in Wi-Fi names and passwords; no | or & in values
    ./install.sh

## Update

After pushing changes to GitHub, on the router:

    cd openwrt-router
    git pull
    ./install.sh

Change settings here, not in LuCI — `install.sh` overwrites `/etc/config`.
