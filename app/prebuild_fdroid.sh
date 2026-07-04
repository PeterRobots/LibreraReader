export MUPDF_VERSION=1.23.7
sed -i -e '/libDepFree/d' -e '/libDepPro/d' -e '/foojay/d' ../settings.gradle.kts
sed -i -e '/enable = true/d' -e '/_appGdriveKey/d' -e '/_admob/d' -e '/googleServices/d' -e '/dep_/d' -e '/libDepFree/d' -e '/libDepPro/d' build.gradle
mkdir src/main/jniLibs
cd ../Builder
sed -i -e '/enable = true/d' -e '/_appGdriveKey/d' -e '/_admob/d' -e '/googleServices/d' -e '/dep_/d' -e '/libDepFree/d' -e '/libDepPro/d' build.gradle
sed -i -e 's|/Users/ivanivanenko/Library/Android/sdk/ndk|$USER_NDK_PATH|g' -e 's|/home/dev/Android/Sdk/ndk|$USER_NDK_PATH|g' link_to_mupdf_$MUPDF_VERSION.sh
#sed -i -e '1a set -e' -e '/git clone/d' -e 's/mkdir/mkdir -p/g' -e 's|"$PATH1/$NDK_VERSION/ndk-build"|"$$NDK$$/ndk-build"|' -e 's/$NDK /$NDK -j$(nproc) /' link_to_mupdf_$MUPDF_VERSION.sh
#cp -r $$MuPDF$$ mupdf-$MUPDF_VERSION
#rm -rf mupdf-$MUPDF_VERSION/thirdparty/{harfbuzz/test,curl/tests,leptonica/prog/fuzzing}