include $(TOPDIR)/rules.mk

PKG_NAME:=luabitop
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

_BASENAME:=LuaBitOp


PKG_MAINTAINER:=waynesg
PKG_SOURCE:=$(_BASENAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/waynesg/lua-bit-op-5.3-fork/releases/download/1.0.3/
PKG_HASH:=e9b47da4d8ac32ed52a81e31950a49895a858e31eaf6aa110bc81f6b0e6dece9
PKG_BUILD_DIR:=$(BUILD_DIR)/$(_BASENAME)-$(PKG_VERSION)
PKG_LICENSE:=MIT


include $(INCLUDE_DIR)/package.mk

define Package/luabitop
  SUBMENU:=Lua
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=luabitop
  URL:=https://github.com/waynesg/lua-bit-op-5.3-fork
  DEPENDS:=+liblua
endef

define Package/luabitop/description
 Lua BitOp is a C extension module for Lua 5.3 which adds bitwise operations on numbers.
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
