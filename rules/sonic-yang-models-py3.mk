SONIC_YANG_MODELS_PY3 = sonic_yang_models-1.0-py3-none-any.whl
$(SONIC_YANG_MODELS_PY3)_SRC_PATH = $(SRC_PATH)/sonic-yang-models
$(SONIC_YANG_MODELS_PY3)_PYTHON_VERSION = 3
$(SONIC_YANG_MODELS_PY3)_DEBS_DEPENDS = $(LIBYANG) $(LIBYANG_CPP) \
                                        $(LIBYANG_PY3) \
                                        $(LIBYANG3) \
                                        $(LIBYANG3_PY3)

SONIC_PYTHON_WHEELS += $(SONIC_YANG_MODELS_PY3)
export SONIC_YANG_MODELS_PY3
