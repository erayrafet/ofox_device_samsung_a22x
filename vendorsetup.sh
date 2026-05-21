#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

#set -o xtrace
FDEVICE="a22x"

fox_get_target_device() {
   local chkdev

   chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" ] && [ -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" ] || [ "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

 	export ALLOW_MISSING_DEPENDENCIES=true
 	export FOX_ALLOW_EARLY_SETTINGS_LOAD=1
	export FOX_ASH_IS_BASH=1
    export FOX_DELETE_AROMAFM=1
    	export FOX_DELETE_INITD_ADDON=1
	export FOX_ENABLE_APP_MANAGER=1
	export FOX_ENABLE_AVB=1
	export FOX_ENABLE_KERNELSU_SUPPORT=0
	export FOX_ENABLE_SUKISU_SUPPORT=0
	export FOX_MISCELLANEOUS_ROOT_DIRECTORY=/external_sd
	export FOX_NO_SAMSUNG_SPECIAL=1
	export FOX_REMOVE_AAPT=1
	export FOX_REMOVE_ZIP_BINARY=1
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_BUSYBOX_BINARY=1
    export FOX_USE_DATE_BINARY=1
	export FOX_USE_LZ4_BINARY=0
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_ZSTD_BINARY=0
	export FOX_VANILLA_BUILD=1
	export LC_ALL="C"
	export TW_DEFAULT_LANGUAGE="en"
	export USE_CCACHE=1

fi

