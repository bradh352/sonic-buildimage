# libyang3

LIBYANG3_VERSION = 3.7.8
LIBYANG3_SUBVERSION = 3
LIBYANG3_FULLVERSION = $(LIBYANG3_VERSION)-$(LIBYANG3_SUBVERSION)

export LIBYANG3_VERSION
export LIBYANG3_SUBVERSION
export LIBYANG3_FULLVERSION

LIBYANG3 = libyang3_$(LIBYANG3_FULLVERSION)_$(CONFIGURED_ARCH).deb
$(LIBYANG3)_SRC_PATH = $(SRC_PATH)/libyang3
SONIC_MAKE_DEBS += $(LIBYANG3)

LIBYANG3_DEV = libyang-dev_$(LIBYANG3_FULLVERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(LIBYANG3),$(LIBYANG3_DEV)))

LIBYANG3_TOOLS = libyang3-tools_$(LIBYANG3_FULLVERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(LIBYANG3),$(LIBYANG3_TOOLS)))

LIBYANG3_DBG = libyang3-dbgsym_$(LIBYANG3_FULLVERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(LIBYANG3),$(LIBYANG3_DBG)))

LIBYANG3_TOOLS_DBG = libyang3-tools-dbgsym_$(LIBYANG3_FULLVERSION)_$(CONFIGURED_ARCH).deb
$(eval $(call add_derived_package,$(LIBYANG3),$(LIBYANG3_TOOLS_DBG)))

export LIBYANG3 LIBYANG3_DBG LIBYANG3_DEV LIBYANG3_TOOLS LIBYANG3_TOOLS_DBG

