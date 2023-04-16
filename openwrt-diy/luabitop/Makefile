include $(TOPDIR)/rules.mk

PKG_NAME:=luabitop
PKG_VERSION:=1.0.3
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/waynesg/lua-bit-op-5.3-fork/archive/refs/tags/$(PKG_VERSION).tar.gz
PKG_HASH:=d401b7e717ddb17596768e8d7e502c55530d0552ef244ba4bd68ef5c5fcba727
PKG_MAINTAINER:=waynesg <waynesg511@gmail.com
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

TARGET_CFLAGS += $(FPIC) -DLUA_USE_LINUX -DLUA_NUMBER_DOUBLE

ifeq ($(findstring $(LINUX_VERSION),2.6 3.10),)
    TARGET_LDFLAGS += -Wl,-E
endif

define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_CPPFLAGS) $(TARGET_CPPFLAGS) -std=gnu99 $(FPIC) -DLUA_USE_LINUX -shared -o $(PKG_BUILD_DIR)/bit.so $(PKG_BUILD_DIR)/src/bit.c
endef

define Package/luabitop/install
	$(INSTALL_DIR) $(1)/usr/lib/lua
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bit.so $(1)/usr/lib/lua
endef

$(eval $(call BuildPackage,luabitop))
