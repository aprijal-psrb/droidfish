LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
SF_SRC_FILES := \
	benchmark.cpp main.cpp movegen.cpp pawns.cpp thread.cpp uci.cpp psqt.cpp \
	bitbase.cpp endgame.cpp material.cpp movepick.cpp position.cpp timeman.cpp ucioption.cpp \
	bitboard.cpp evaluate.cpp misc.cpp search.cpp tt.cpp syzygy/tbprobe.cpp
MY_ARCH_DEF :=
ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),arm64-v8a x86_64 mips64))
  MY_ARCH_DEF += -DIS_64BIT
endif

ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),armeabi-v7a arm64-v8a x86 x86_64))
  LOCAL_ARM_NEON := true
endif
ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),x86 x86_64))
  LOCAL_CFLAGS += -msse3 -mpopcnt
endif
ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),armeabi-v7a x86))
  LOCAL_MODULE    := stockfish-nopie
  LOCAL_SRC_FILES := $(SF_SRC_FILES)
  LOCAL_CFLAGS    += -O3 -fno-exceptions -fno-rtti -std=c++11 $(MY_ARCH_DEF) -DUSE_POPCNT -flto
  LOCAL_LDFLAGS	  += -flto
  include $(BUILD_EXECUTABLE)
endif

include $(CLEAR_VARS)
ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),armeabi-v7a arm64-v8a x86 x86_64))
  LOCAL_ARM_NEON := true
endif
ifeq ($(TARGET_ARCH_ABI),$(filter $(TARGET_ARCH_ABI),x86 x86_64))
  LOCAL_CFLAGS += -msse3 -mpopcnt
endif
LOCAL_MODULE    := stockfish
LOCAL_SRC_FILES := $(SF_SRC_FILES)
LOCAL_CFLAGS    += -O3 -fno-exceptions -fno-rtti -std=c++11 $(MY_ARCH_DEF) -DUSE_POPCNT -flto -fPIE
LOCAL_LDFLAGS	+= -flto -fPIE -pie
include $(BUILD_EXECUTABLE)