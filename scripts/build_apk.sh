#!/bin/bash
# Сборка Android APK.
# Требуется: Flutter и Android SDK (ANDROID_HOME или Android Studio).

set -e
cd "$(dirname "$0")/.."

# Попытка найти Android SDK
if [ -z "$ANDROID_HOME" ]; then
  if [ -d "$HOME/Library/Android/sdk" ]; then
    export ANDROID_HOME="$HOME/Library/Android/sdk"
  elif [ -d "/opt/homebrew/share/android-commandlinetools" ]; then
    export ANDROID_HOME="/opt/homebrew/share/android-commandlinetools"
  elif [ -d "$HOME/Android/Sdk" ]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
  else
    echo "Android SDK не найден. Установите Android Studio или command-line tools и задайте ANDROID_HOME."
    echo "На macOS часто: export ANDROID_HOME=\$HOME/Library/Android/sdk"
    exit 1
  fi
fi

echo "ANDROID_HOME=$ANDROID_HOME"
echo "Building APK..."
flutter build apk

echo ""
echo "Готово. APK: build/app/outputs/flutter-apk/app-release.apk"
