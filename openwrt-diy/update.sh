#!/bin/bash
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}
#svn co https://github.com/waynesg/github-actions-build-openwrt/trunk/build/Lede_x86_64/diy/package/base-files/files/etc ./settings
#svn co https://github.com/waynesg/github-actions-build-openwrt/trunk/build/Lede_x86_64/files/etc ./settings/etc

# argon-theme-config
svn co https://github.com/jerrykuku/luci-app-argon-config/trunk ./luci-app-argon-config

# theme
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon ./luci-theme-argon
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-theme-opentomcat
svn co https://github.com/sirpdboy/luci-theme-opentopd/trunk ./luci-theme-opentopd
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-theme-atmaterial
svn co https://github.com/rosywrt/luci-theme-rosy/trunk/luci-theme-rosy
svn co https://github.com/kiddin9/luci-theme-edge/branches/18.06 ./luci-theme-edge

# apps

#mosdns
svn co https://github.com/sbwml/luci-app-mosdns/trunk ./luci-app-mosdns

#VSSR
svn co https://github.com/jerrykuku/luci-app-vssr/trunk ./luci-app-vssr

#Bypass
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass ./luci-app-bypass
#svn co https://github.com/kiddin9/openwrt-packages/trunk/tcping ./luci-app-bypass/tcping
svn co https://github.com/xiangfeidexiaohuo/op-ipkg/trunk ./luci-app-bypass/luci-lib-ipkg
#SSR-PLUS
svn co https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus

#adblock-plus
#svn co https://github.com/small-5/luci-app-adblock-plus/branches/18.06 ./luci-app-adblock-plus
#gowedav
svn co https://github.com/project-openwrt/openwrt-gowebdav/trunk ./luci-app-gowebdav
svn co https://github.com/1715173329/gowebdav/trunk ./luci-app-gowebdav/gowebdav
#smartinfo
svn co https://github.com/iamaluckyguy/luci-app-smartinfo/trunk ./luci-app-smartinfo
#serverchan
svn co https://github.com/tty228/luci-app-serverchan/trunk ./luci-app-serverchan
#autotimeset(自动重启，关机)
svn co https://github.com/sirpdboy/luci-app-autotimeset/trunk ./luci-app-autotimeset
#poweroff 
svn co https://github.com/esirplayground/luci-app-poweroff/trunk ./luci-app-poweroff
#netdata
svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-netdata ./luci-app-netdata
svn co https://github.com/siropboy/sirpdboy-package/trunk/netdata ./luci-app-netdata/netdata
#OAF
svn co https://github.com/destan19/OpenAppFilter/trunk ./luci-app-oaf
#OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/haproxy
#eqos
svn co https://github.com/littletao08/luci-app-eqos/trunk ./luci-app-eqos
#wrtbwmon
#svn co https://github.com/firker/luci-app-wrtbwmon-zh/trunk/luci-app-wrtbwmon-zh
#svn co https://github.com/firker/luci-app-wrtbwmon-zh/trunk/wrtbwmon
#advanced
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-advanced

#speedlimited
svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-control-speedlimit

#cpulimited
svn co https://github.com/kiddin9/openwrt-packages/trunk/cpulimit ./luci-app-cpulimit/cpulimit
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-cpulimit ./luci-app-cpulimit
#filebrowser
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
#autopoweroff
svn co https://github.com/siropboy/mypackages/luci-app-autopoweroff/trunk
#timewol
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-control-timewol
#weburl
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-control-weburl
#webrestriction
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-control-webrestriction
#speedlimited
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-control-speedlimit
#ikoolproxy
svn co https://github.com/iyaof/luci-app-ikoolproxy/trunk ./luci-app-ikoolproxy
#pptp
svn co https://github.com/siropboy/mypackages/trunk/luci-app-pptp-vpnserver-manyusers
#ipsec
svn co https://github.com/waynesg/luci-app-ipsec-vpnserver-manyusers/trunk ./luci-app-ipsec-vpnserver-manyusers
#unblockneteasemusic
git clone -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic ./luci-app-unblockneteasemusic
#syncthing
svn co https://github.com/project-openwrt/openwrt/trunk/package/ctcgfw/luci-app-syncthing ./luci-app-syncthing
#pushbot
svn co https://github.com/zzsj0928/luci-app-pushbot/trunk ./luci-app-pushbot
#订阅转换subconverter
svn co https://github.com/tindy2013/openwrt-subconverter/trunk ./luci-app-subconverter


#autoipsetadder
svn co https://github.com/waynesg/luci-app-autoipsetadder/trunk ./luci-app-autoipsetadder

# passwall
svn co https://github.com/xiaorouji/openwrt-passwall/trunk ./luci-app-dependence
#git clone https://github.com/waynesg/passwall.git ./luci-app-dependence

#node-request
svn co https://github.com/jerrykuku/node-request/trunk ./luci-app-dependence/node-request
#lua-neturl
svn co https://github.com/fw876/helloworld/trunk/lua-neturl ./luci-app-dependence/lua-neturl
svn co https://github.com/fw876/helloworld/trunk/redsocks2 ./luci-app-dependence/redsock2
svn co https://github.com/kiddin9/openwrt-packages/trunk/lua-maxminddb ./luci-app-dependence/lua-maxminddb
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall -b luci openwrt-passwall && mvdir openwrt-passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2 && mvdir openwrt-passwall2

#iptv
svn co https://github.com/riverscn/openwrt-iptvhelper/trunk ./luci-app-iptvhelper
svn co https://github.com/riverscn/luci-app-omcproxy/branches/18.06 ./luci-app-omcproxy

#ddnsto
svn co https://github.com/linkease/nas-packages/trunk/network/services/ddnsto ./luci-app-ddnsto/ddnsto
svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-ddnsto ./luci-app-ddnsto
#svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-koolddns

#CloudflareSppedtest
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-cloudflarespeedtest ./luci-app-cloudflarespeedtest
svn co https://github.com/immortalwrt-collections/openwrt-cdnspeedtest/trunk/cdnspeedtest ./luci-app-cloudflarespeedtest/cdnspeedtest

#Speedtest
svn co https://github.com/sirpdboy/netspeedtest/trunk ./luci-app-netspeedtest

#Pandownload-fake-server
#svn co https://github.com/kiddin9/openwrt-packages/trunk/pandownload-fake-server

#homebridge
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-homebridge

#zospusher
svn co https://github.com/zhengwenxiao/luci-app-zospusher/trunk ./luci-app-zospusher

#aliyun webdav
svn co https://github.com/jerrykuku/luci-app-go-aliyundrive-webdav/trunk ./luci-app-go-aliyundrive-webdav
svn co https://github.com/jerrykuku/go-aliyundrive-webdav/trunk ./luci-app-go-aliyundrive-webdav/go-aliyundrive-webdav

#webguide
svn co https://github.com/p1ay8y3ar/luci-app-webguide/trunk/luci-app-webguide ./luci-app-webguide

#Onliner
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-onliner ./luci-app-onliner

#Supervisor
svn co https://github.com/sundaqiang/openwrt-packages/trunk/luci-app-supervisord ./luci-app-supervisord

#Adguardhome
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome ./luci-app-adguardhome
svn co https://github.com/kiddin9/openwrt-packages/trunk/adguardhome ./luci-app-adguardhome/adguardhome

#svn co https://github.com/project-openwrt/openwrt-tmate/trunk ./openwrt-tmate
#svn co https://github.com/koshev-msk/luci-app-modeminfo
#svn co https://github.com/tindy2013/openwrt-subconverter/trunk ./openwrt-subconverter
#svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-aliddns

#nezha
svn co https://github.com/Erope/openwrt_nezha/trunk/luci-app-nezha ./luci-app-nezha
svn co https://github.com/Erope/openwrt_nezha/trunk/openwrt-nezha ./luci-app-nezha/openwrt-nezha

#Smartdns
svn co https://github.com/pymumu/luci-app-smartdns/branches/lede ./luci-app-smartdns
#svn co https://github.com/pymumu/openwrt-smartdns/trunk ./luci-app-smartdns/smartdns

#Pikpak
svn co https://github.com/ykxVK8yL5L/pikpak-webdav/trunk/openwrt ./luci-app-pikpak-webdav

svn co https://github.com/koshev-msk/modemfeed/trunk/luci/applications/luci-app-telegrambot ./luci-app-telegrambot
svn co https://github.com/koshev-msk/modemfeed/trunk/packages/net/telegrambot ./luci-app-telegrambot/telegrambot

svn co https://github.com/esirplayground/openwrt-ethr/trunk ./luci-app-ethr

#svn co https://github.com/tuanqing/openwrt-mentohust/trunk ./openwrt-mentohust
#svn co https://github.com/tuanqing/luci-app-mentohust/trunk ./luci-app-mentohust
#svn co https://github.com/msylgj/luci-app-tencentddns/trunk ./luci-app-tencentddns
#svn co https://github.com/jerrykuku/luci-app-ttnode/trunk ./luci-app-ttnode
#svn co https://github.com/siropboy/sirpdboy-package/trunk/luci-app-socat
#svn co https://github.com/tuanqing/install-program/trunk ./install-program

#Wizard
svn co https://github.com/kiddin9/luci-app-wizard/trunk ./luci-app-wizard

#webd netdisk
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/webd ./luci-app-webd/webd
svn co https://github.com/Hyy2001X/AutoBuild-Packages/trunk/luci-app-webd ./luci-app-webd

#shortcut
svn co https://github.com/doushang/luci-app-shortcutmenu/trunk/luci-app-shortcutmenu ./luci-app-shortcutmenu

#tcpdump
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-packet-capture ./luci-app-packet-capture

#tn-netports
#git clone -b v1.x https://github.com/tano-systems/luci-app-tn-netports ./luci-app-tn-netports

#whistle
svn co https://github.com/fjqingyou/luci-app-whistle/trunk ./luci-app-whistle

#homebox
svn co https://github.com/jjm2473/openwrt-apps/trunk/luci-app-homebox ./luci-app-homebox
svn co https://github.com/jjm2473/openwrt-apps/trunk/homebox ./luci-app-homebox/homebox

#Alist
svn co https://github.com/sbwml/luci-app-alist/trunk ./luci-app-alist
#mv ./luci-app-alist/luci-app-alist/po/zh_Hans ./luci-app-alist/luci-app-alist/po/zh-cn

#telegrambot
#svn co https://github.com/alexwbaule/telegramopenwrt/trunk ./telegramopenwrt

#unblockneteasemusic
svn co https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic/trunk ./luci-app-unblockneteasemusic

# autocore
# svn co https://github.com/sirpdboy/myautocore/trunk/myautocore ./openwrt-diy/autocore

#accesscontrtrol-plus
svn co https://github.com/kingyond/luci-app-accesscontrol-plus/trunk/luci-app-accesscontrol-plus ./luci-app-accesscontrol-plus

#parents-control
svn co https://github.com/sirpdboy/luci-app-parentcontrol/trunk ./luci-app-parentcontrol

#msd_lite
svn co https://github.com/ximiTech/luci-app-msd_lite/trunk ./luci-app-msd_lite
svn co https://github.com/ximiTech/msd_lite/trunk ./luci-app-dependence/msd_lite

#quickstart
#svn co https://github.com/linkease/nas-packages-luci/trunk/luci/luci-app-quickstart ./luci-app-quickstart
#svn co https://github.com/linkease/nas-packages/trunk/network/services/quickstart ./luci-app-quickstart/quickstart
#svn co https://github.com/linkease/istore/trunk/luci/luci-app-store ./luci-app-store
#svn co https://github.com/linkease/istore/trunk/luci/luci-lib-taskd ./luci-app-store/luci-lib-taskd
#svn co https://github.com/linkease/istore/trunk/luci/luci-lib-xterm ./luci-app-store/luci-lib-xterm
#svn co https://github.com/linkease/istore/trunk/luci/taskd ./luci-app-store/taskd
#svn co https://github.com/xiangfeidexiaohuo/op-ipkg/trunk/luci-lib-ipkg ./luci-app-store/luci-lib-ipkg

rm -rf ./*/.git & rm -f ./*/.gitattributes
rm -rf ./*/.svn & rm -rf ./*/.github & rm -rf ./*/.gitignore
rm -rf ./*/*/.svn
exit 0
