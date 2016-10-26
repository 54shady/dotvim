# android top directory
ANDROID_TOP_DIR="/home/zeroway/3288/src/3288_4.4"

# header, don't know what's this
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > filenametags

# find files except these directories
find $ANDROID_TOP_DIR \
	-path "$ANDROID_TOP_DIR/abi"                       -prune -o \
	-path "$ANDROID_TOP_DIR/art"                       -prune -o \
	-path "$ANDROID_TOP_DIR/bionic"                    -prune -o \
	-path "$ANDROID_TOP_DIR/bootable"                  -prune -o \
	-path "$ANDROID_TOP_DIR/build"                     -prune -o \
	-path "$ANDROID_TOP_DIR/cts"                       -prune -o \
	-path "$ANDROID_TOP_DIR/dalvik"                    -prune -o \
	-path "$ANDROID_TOP_DIR/developers"                -prune -o \
	-path "$ANDROID_TOP_DIR/development"               -prune -o \
	-path "$ANDROID_TOP_DIR/docs"                      -prune -o \
	-path "$ANDROID_TOP_DIR/external"                  -prune -o \
	-path "$ANDROID_TOP_DIR/libcore"                   -prune -o \
	-path "$ANDROID_TOP_DIR/libnativehelper"           -prune -o \
	-path "$ANDROID_TOP_DIR/ndk"                       -prune -o \
	-path "$ANDROID_TOP_DIR/out"                       -prune -o \
	-path "$ANDROID_TOP_DIR/packages"                  -prune -o \
	-path "$ANDROID_TOP_DIR/pdk"                       -prune -o \
	-path "$ANDROID_TOP_DIR/prebuilts"                 -prune -o \
	-path "$ANDROID_TOP_DIR/RKDocs"                    -prune -o \
	-path "$ANDROID_TOP_DIR/rkst"                      -prune -o \
	-path "$ANDROID_TOP_DIR/RKTools"                   -prune -o \
	-path "$ANDROID_TOP_DIR/rockdev"                   -prune -o \
	-path "$ANDROID_TOP_DIR/sdk"                       -prune -o \
	-path "$ANDROID_TOP_DIR/system"                    -prune -o \
	-path "$ANDROID_TOP_DIR/tools"                     -prune -o \
	-path "$ANDROID_TOP_DIR/vendor"                    -prune -o \
	-type f -printf "%f\t%p\t1\n" | sort -f >> $ANDROID_TOP_DIR/filenametags
