./setup_local.sh
cd app
./prebuild_fdroid.sh
cd ../Builder
./link_to_mupdf_1.23.7.sh
cd ..
./gradlew assembleFdroid