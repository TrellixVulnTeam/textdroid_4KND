LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := liblepti

BLACKLIST_SRC_FILES := \
  %endiantest.c \
  %freetype.c \
  %xtractprotos.c

LEPTONICA_SRC_FILES := \
  $(subst $(LOCAL_PATH)/,,$(wildcard $(ILEPTONICA_PATH)/src/*.c))

LOCAL_SRC_FILES := \
  $(filter-out $(BLACKLIST_SRC_FILES),$(LEPTONICA_SRC_FILES))

LOCAL_CFLAGS := \
  -DHAVE_CONFIG_H

LOCAL_LDLIBS := -lz

# jni

LOCAL_SRC_FILES += \
  box.cpp \
  boxa.cpp \
  pix.cpp \
  pixa.cpp \
  utilities.cpp \
  readfile.cpp \
  writefile.cpp \
  jni.cpp

LOCAL_C_INCLUDES += \
  $(LOCAL_PATH) \
  $(ILEPTONICA_PATH)/src \
  $(ILEPTONICA_PATH)/..

LOCAL_LDLIBS += \
  -ljnigraphics \
  -llog


LOCAL_SHARED_LIBRARIES:= libjpeg libpngo

LOCAL_EXPORT_C_INCLUDES += \
  $(ILEPTONICA_PATH)/src \
  $(ILEPTONICA_PATH)/..

include $(BUILD_SHARED_LIBRARY)
