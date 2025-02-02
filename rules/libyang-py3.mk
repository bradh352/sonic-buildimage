# libyang python3 wheel

LIBYANG_PY3_VERSION = 3.0.3
LIBYANG_PY3_ABI := cp$(shell python3 -c "import sysconfig; print(sysconfig.get_python_version().replace('.',''))")
LIBYANG_PY3_PLAT := $(shell python3 -c "import sysconfig; print(sysconfig.get_platform().replace('.','_').replace('-','_'))")
LIBYANG_PY3 := libyang-$(LIBYANG_PY3_VERSION)-$(LIBYANG_PY3_ABI)-$(LIBYANG_PY3_ABI)-$(LIBYANG_PY3_PLAT).whl
$(LIBYANG_PY3)_SRC_PATH = $(SRC_PATH)/libyang-py3
$(LIBYANG_PY3)_PYTHON_VERSION = 3
$(LIBYANG_PY3)_DEBS_DEPENDS = $(LIBYANG3) $(LIBYANG3_DEV)
$(LIBYANG_PY3)_DEPENDS =
$(LIBYANG_PY3)_RDEPENDS = $(LIBYANG3)
LIBYANG_PYTHON_FORCE_VERSION=$(LIBYANG_PY3_VERSION)
export LIBYANG_PYTHON_FORCE_VERSION
SONIC_PYTHON_WHEELS += $(LIBYANG_PY3)
