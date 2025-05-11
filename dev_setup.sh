#!/bin/bash

set -e

JDK_VERSION=17
JAVA_HOME_EXPORT='export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))'
JAVA_HOME_PATH_EXPORT='export PATH=$PATH:$JAVA_HOME/bin'

ANDROID_CMD_VERSION='13114758'
ANDROID_PLATFORM_VERSION='35'
ANDROID_BUILD_TOOLS_VERSION='35.0.1'
ANDROID_CMD_PATH='cmdline-tools'
ANDROID_SDK_PATH="$HOME/Android/Sdk"
ANDROID_SDK_EXPORT='export ANDROID_SDK_ROOT=$HOME/Android/Sdk'
ANDROID_SDK_PATH_EXPORT='export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools'

NVM_VERSION='0.40.3'
NODE_VERSION=22

echo "Installing Visual Studio Code..."
sudo curl -L -o /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 
sudo apt install -y /tmp/vscode.deb || sudo rm -f /tmp/vscode.deb

echo "Installing JDK..."
sudo apt update
sudo apt install -y openjdk-${JDK_VERSION}-jdk
if ! grep -q "$JAVA_HOME_EXPORT" $HOME/.bashrc; then
  echo "$JAVA_HOME_EXPORT" >> $HOME/.bashrc
  echo "$JAVA_HOME_PATH_EXPORT" >> $HOME/.bashrc
  source $HOME/.bashrc
fi

echo "Installing Android SDK..."
sudo apt install -y unzip
rm -rf ${ANDROID_SDK_PATH}/${ANDROID_CMD_PATH}
mkdir -p ${ANDROID_SDK_PATH}/${ANDROID_CMD_PATH}
curl -L -o $HOME/commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-${ANDROID_CMD_VERSION}_latest.zip
unzip $HOME/commandlinetools.zip -d ${ANDROID_SDK_PATH}/${ANDROID_CMD_PATH}
rm -f $HOME/commandlinetools.zip
mv ${ANDROID_SDK_PATH}/${ANDROID_CMD_PATH}/cmdline-tools ${ANDROID_SDK_PATH}/${ANDROID_CMD_PATH}/latest
if ! grep -q "$ANDROID_SDK_EXPORT" $HOME/.bashrc; then
  echo "$ANDROID_SDK_EXPORT" >> $HOME/.bashrc
  echo "$ANDROID_SDK_PATH_EXPORT" >> $HOME/.bashrc
  source $HOME/.bashrc
fi
sdkmanager "platform-tools" "platforms;android-$ANDROID_PLATFORM_VERSION" "build-tools;$ANDROID_BUILD_TOOLS_VERSION"

echo "Installing Git..."
sudo apt install -y git-all

echo "Installing NodeJS..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source ~/.bashrc
nvm install $NODE_VERSION

echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean -y
