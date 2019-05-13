#!/bin/bash

cp -r Android/ ~/

mkdir -p ~/.android
touch ~/.android/repositories.cfg

sdkmanager=~/Android/Sdk/tools/bin/sdkmanager

sdkmanager "build-tools;28.0.3" "platforms;android-28" "system-images;android-28;google_apis;x86_64" "sources;android-28"

sleep 1

sdkmanager --licenses

# Export Path Variables in Bash or Zsh

pathvar="
export ANDROID_HOME=~/Android/Sdk
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
"

if [-f file="~/.zshrc"] then
	echo pathvar >> ~/.zshrc
	source ~/.zshrc
else
	echo pathvar >> ~/.bashrc
	source ~/.bashrc
fi

