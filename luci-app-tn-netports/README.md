# Network ports status LuCI application

## Description
This package allows you to monitor current state of the network interfaces specified in configuration file (`/etc/config/luci_netports`).

## Dependencies
This LuCI application developed for LuCI master branch. Application requires luabitop package to be installed.

Master branch of this repository requires index status page client side view implementation in the LuCI (see commit https://github.com/openwrt/luci/commit/c85af3d7618b55c499ce4bf58e3896068bd413ae). Support for older LuCI releases (e.g. for version 18.06.x) is left in the [v1.x](https://github.com/tano-systems/luci-app-tn-netports/tree/v1.x) branch of this repository.

## Supported languages
- English
- Russian

## UCI configuration
UCI configuration for this application is stored in `/etc/config/luci_netports` file.

This file contain one `global` section with global application settings and one or more `port` sections with network ports settings.

### Global settings

The `global` section contains global application settings. Default `global` section configuration:
```
config global 'global'
	option default_additional_info 'false'
	option default_h_mode          'false'
	option hv_mode_switch_button   'false'
```

These options can be set in the `global` section:

| Name                      | Type    | Required | Default | Description                                                                  |
| ------------------------- | ------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `default_additional_info` | boolean | no       | false   | Display additional information in horizontal view mode by default.           |
| `default_h_mode`          | boolean | no       | false   | Use horizontal view mode by default.                                         |
| `hv_mode_switch_button`   | boolean | no       | false   | Show button for manual switching between horizontal and vertical view modes. |

Horizontal display mode can be used maximum for 6 interfaces. If there are more interfaces, the vertical display mode will be automatically activated without the possibility of switching to the horizontal mode.

### Ports settings

Sections of the type `port` declare network port settings for displaying in application.

A minimal port declaration consists of the following lines:
```
config port
	option ifname 'eth0'
```
These options can be set in the `port` sections:

| Name                      | Type    | Required | Default | Description                                                                  |
| ------------------------- | ------- | -------- | ------- | ---------------------------------------------------------------------------- |
| `ifname`                  | string  | yes      | (none)  | Network interface name. |
| `name`                    | string  | no       | value of `ifname` | Custom port name for displaying in application. |
| `type`                    | string  | no       | `auto` | Custom port type. Available port types listed in the table below. |
| `disable`                 | boolean | no       | false  | Do not display specified interface. |
