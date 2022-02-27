# luci-app-whistle
这是 [whistle](https://github.com/avwo/whistle/) 在 [openwrt](https://github.com/openwrt/openwrt)、[lede](https://github.com/coolsnowwolf/lede) 环境的 luci 管理端。

当前仅仅具备了基础的配置、启动管理支持。后续功能等待持续完善！

欢迎提交 issues，也欢迎任何有益的 pr

# 当前具备的功能
支持安装成服务，可开机自启动 whistle

支持绑定特定网卡，或者 0.0.0.0 这个地址绑定所有网卡，默认是路由器的 192.168 开头的这个 ip 地址

支持绑定自定义端口

支持自定义证书

支持身份验证

# 依赖环境
当前项目仅仅是 whistle 的 luci 可视化管理端，并不能代替 whistle 工作。

您需要安装 node 以及 whistle 最后再安装这个才能正常工作，如果没安装 node 和 whistle，那么 luci-app-whistle 什么也做不了

关于 node 的安装，因为 openwrt/lede 有各种 CPU 架构的原因，您需要找到适用于您路由器设备的安装包，然后自行安装它。

而 whistle 则是在 node 安装完毕之后，执行 npm install -g whistle 这个命令进行安装的。

只有上面两个安装成功之后，最后才是安装当前这个 luci-app-whistle

# 使用方式 - 移动设备
设置 -> wifi设置 -> 当前已经连接的 wifi 信道点开它的高级设置 -> 代理 -> 选择手动设置

主机名输入路由器的 ip 地址

端口填写管理端设置的端口

现在，已经建立的网络连接没辙，但是后续新建立的网络连接将会根据路由器中 whistle 指定的规则进行工作：直连、代理、拦截、转发等等。

根据个人需要指定自己想要的规则，具体可查阅 whistle 的相关文档

# 常见问题
安装 luci-app-whistle、以及 i18n 时会提示：uci: Entry not found。这个未找到解决方案。不过不影响使用，暂时可以无视

# issuse
如果是 luci-app-whistle 相关问题，可以到 [issues](https://github.com/fjqingyou/luci-app-whistle/issues) 进行提交

如果是与 whistle 的相关的，请移驾 [whistle issues](https://github.com/avwo/whistle/issues) 进行提交！

# License
[MIT](https://github.com/fjqingyou/luci-app-whistle/blob/master/LICENSE)
