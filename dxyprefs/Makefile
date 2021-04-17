include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = dxyprefs
dxyprefs_FILES = DXYRootListController.m
dxyprefs_FRAMEWORKS = UIKit
dxyprefs_PRIVATE_FRAMEWORKS = Preferences
dxyprefs_INSTALL_PATH = /Library/PreferenceBundles
dxyprefs_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/dxprefs.plist$(ECHO_END)
