./setup_local.sh
cd app
./prebuild_fdroid.sh
cd ../Builder
./link_to_mupdf_$MUPDF_VERSION.sh
cd ..
./gradlew assembleFdroid