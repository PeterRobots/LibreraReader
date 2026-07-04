# local.properties variables
USER_SDK_PATH=/home/pinzani/Android/Sdk
USER_NDK_PATH=/home/pinzani/Android/Sdk/ndk
USER_KEYTOOL_PATH=~/.local/share/JetBrains/Toolbox/apps/android-studio/jbr/bin/keytool

# transfer local.properties
sed -i -E "s#(sdk.dir=).*#\1${USER_SDK_PATH}#g" local.properties
echo USER_NDK_PATH=${USER_NDK_PATH} | tee -a local.properties

# gradle.properties variables (keystore)
RELEASE_STORE_FILE=/home/pinzani/Documents/git_projects/LibreraReader/keystore.pkcs12
RELEASE_STORE_PASSWORD=tiptoe
RELEASE_KEY_PASSWORD=tiptoe
RELEASE_KEY_ALIAS=PeterRobots

# generate keystore with keytool
${USER_KEYTOOL_PATH} -genkeypair -v -storetype PKCS12 -keystore keystore.pkcs12 -alias ${RELEASE_KEY_ALIAS} -storepass ${RELEASE_STORE_PASSWORD} -keypass ${RELEASE_KEY_PASSWORD} -keyalg RSA -keysize 2048 -validity 10000

# populate gradle keystore properties
cat > .gradle/gradle.properties << EOL
  RELEASE_STORE_FILE=$RELEASE_STORE_FILE
  RELEASE_STORE_PASSWORD=$RELEASE_STORE_PASSWORD
  RELEASE_KEY_PASSWORD=$RELEASE_KEY_PASSWORD
  RELEASE_KEY_ALIAS=$RELEASE_KEY_ALIAS
EOL