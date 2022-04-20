# luci-app-alist

A file list program that supports multiple storage.

## How to build

Enter in your openwrt/package/ or other

### Openwrt official SnapShots

```shell
git clone https://github.com/sbwml/openwrt-alist --depth=1
make menuconfig # choose LUCI -> Applications -> luci-app-alist
make V=s
```

*PS: version v2.4.1+ requires golang18, openwrt 21.02 needs to switch go version*

```shell
rm -rf feeds/packages/lang/golang
svn co https://github.com/openwrt/packages/branches/openwrt-22.03/lang/golang feeds/packages/lang/golang
```
