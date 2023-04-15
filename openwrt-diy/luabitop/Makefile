#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luabitop
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

_BASENAME:=LuaBitOp

PKG_MAINTAINER:=Maxim Storchak <m.storchak@gmail.com>
PKG_SOURCE_VERSION:=$(PKG_VERSION)-support-lua5-3+
PKG_SOURCE:=$(_BASENAME)-$(PKG_SOURCE_VERSION).tar.gz
PKG_SOURCE_URL:=http://bitop.luajit.org/download/
PKG_HASH:=1207c9293dcd52eb9dca6538d1b87352bd510f4e760938f5048433f7f272ce99
PKG_BUILD_DIR:=$(BUILD_DIR)/$(_BASENAME)-$(PKG_VERSION)
PKG_SOURCE_PATCHFILES:=LuaBitOp-1.0.2-support-lua5-3+.patch
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/luabitop
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=luabitop
  URL:=http://bitop.luajit.org/
  DEPENDS:=+liblua
endef

define Package/luabitop/description
Lua BitOp is a C extension module for Lua 5.1/5.2 which adds bitwise operations on numbers.
endef

define Package/luabitop/prepare
$(call Build/Prepare/Default)
$(foreach patch,$(PKG_SOURCE_PATCHFILES),$(call PatchFile,$(PKG_BUILD_DIR)/$(patsubst %.patch,%,$(notdir $(patch))),$(CURDIR)/$(patsubst https://cloud.github.com/downloads/davidm/lua-bit-numberlua,https://raw.githubusercontent.com/davidm/lua-bit-numberlua/master,$(strip $(filter %.patch,$(PKG_SOURCE_URL)))) && touch $(PKG_BUILD_DIR)/.prepared_$(basename $(notdir $(patch)))))
endef

define Build/Configure
endef

TARGET_CFLAGS += $(FPIC) -DLUA_USE_LINUX -DLUA_NUMBER_DOUBLE

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_CPPFLAGS) -std=gnu99 $(FPIC) -DLUA_USE_LINUX -shared -o $(PKG_BUILD_DIR)/bit.so $(PKG_BUILD_DIR)/bit.c
endef

define Package/luabitop/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bit.so $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,luabitop))
