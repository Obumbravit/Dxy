export THEOS = /var/theos
export ARCHS = arm64 arm64e

DEBUG = 0
FINALPACKAGE = 1

INSTALL_TARGET_PROCESSES = SpringBoard
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 13.3

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Dxy
Dxy_FILES = Dxy.x
Dxy_FRAMEWORKS = UIKit
Dxy_PRIVATE_FRAMEWORKS = MediaRemote
Dxy_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk
SUBPROJECTS += dxyprefs
include $(THEOS)/makefiles/aggregate.mk
