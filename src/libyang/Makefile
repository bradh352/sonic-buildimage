.ONESHELL:
SHELL = /bin/bash
.SHELLFLAGS += -e

LIBYANG_URL = http://debian-archive.trafficmanager.net/debian/pool/main/liby/libyang

DSC_FILE = libyang_$(LIBYANG_FULLVERSION).dsc
ORIG_FILE = libyang_$(LIBYANG_VERSION).orig.tar.gz
DEBIAN_FILE = libyang_$(LIBYANG_FULLVERSION).debian.tar.xz

DSC_FILE_URL = $(LIBYANG_URL)/$(DSC_FILE)
ORIG_FILE_URL = $(LIBYANG_URL)/$(ORIG_FILE)
DEBIAN_FILE_URL = $(LIBYANG_URL)/$(DEBIAN_FILE)

MAIN_TARGET = $(LIBYANG)
DERIVED_TARGETS = $(LIBYANG_DEV) $(LIBYANG_DBG) $(LIBYANG_CPP) $(LIBYANG_CPP_DEV) $(LIBYANG_CPP_DBG) $(YANG_TOOLS) $(LIBYANG_TOOLS) $(LIBYANG_TOOLS_DBG)

$(addprefix $(DEST)/, $(MAIN_TARGET)): $(DEST)/% :
        # Obtaining the libyang
	rm -fr ./libyang-$(LIBYANG_VERSION)

	# download debian libyang
	wget -NO "$(DSC_FILE)" $(DSC_FILE_URL)
	wget -NO "$(ORIG_FILE)" $(ORIG_FILE_URL)
	wget -NO "$(DEBIAN_FILE)" $(DEBIAN_FILE_URL)
	dpkg-source -x libyang_$(LIBYANG_FULLVERSION).dsc

	# Rename back to just libyang instead of libyang1 for compatibility with v1.0.73
	pushd libyang-$(LIBYANG_VERSION)
	sed -i -e 's/libyang1/libyang/g' -e 's/libyang-cpp1/libyang-cpp/g' debian/control debian/libyang1.lintian-overrides debian/libyang1.symbols
	mv debian/libyang-cpp1.install debian/libyang-cpp.install
	mv debian/libyang1.install debian/libyang.install
	mv debian/libyang1.lintian-overrides debian/libyang.lintian-overrides
	mv debian/libyang1.symbols debian/libyang.symbols

	# Enable large file support for 32-bit arch
	echo 'add_definitions(-D_FILE_OFFSET_BITS=64)' >> CMakeLists.txt

ifeq ($(CROSS_BUILD_ENVIRON), y)
	dpkg-buildpackage -rfakeroot -b -us -uc -a$(CONFIGURED_ARCH) -Pcross,nocheck -j$(SONIC_CONFIG_MAKE_JOBS) --admindir $(SONIC_DPKG_ADMINDIR)
else
	dpkg-buildpackage -rfakeroot -b -us -uc -j$(SONIC_CONFIG_MAKE_JOBS) --admindir $(SONIC_DPKG_ADMINDIR)
endif
	popd

	# Move the newly-built .deb packages to the destination directory
	mv $* $(DERIVED_TARGETS) $(DEST)/

$(addprefix $(DEST)/, $(DERIVED_TARGETS)): $(DEST)/% : $(DEST)/$(MAIN_TARGET)
