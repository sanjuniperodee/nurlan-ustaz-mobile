#!/bin/bash
# Создаёт keystore для подписания release-сборок (APK / App Bundle).
# Запускать из корня проекта: ./scripts/create_upload_keystore.sh
# Keystore будет создан в mobile/android/upload-keystore.jks

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ANDROID_DIR="$(cd "$SCRIPT_DIR/../android" && pwd)"
KEYSTORE_PATH="$ANDROID_DIR/upload-keystore.jks"

# keytool требует Java — используем из Android Studio, если JAVA_HOME не задан
if [ -z "$JAVA_HOME" ] || ! command -v keytool &>/dev/null; then
  if [ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]; then
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"
  elif [ -d "$HOME/Library/Java/JavaVirtualMachines" ] && [ -n "$(ls -A "$HOME/Library/Java/JavaVirtualMachines" 2>/dev/null)" ]; then
    export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/$(ls "$HOME/Library/Java/JavaVirtualMachines" | head -1)/Contents/Home"
    export PATH="$JAVA_HOME/bin:$PATH"
  fi
fi
if ! command -v keytool &>/dev/null; then
  echo "Ошибка: не найден keytool (нужна Java). Установите Android Studio или JDK и задайте JAVA_HOME."
  exit 1
fi

if [ -f "$KEYSTORE_PATH" ]; then
  echo "Keystore уже существует: $KEYSTORE_PATH"
  echo "Если нужен новый — переименуйте или удалите текущий файл."
  exit 0
fi

echo "Создание keystore для подписания release..."
echo "Файл: $KEYSTORE_PATH"
echo ""
echo "Вам будет предложено ввести:"
echo "  - пароль хранилища (и повторить)"
echo "  - имя, организацию и т.д. (можно заполнить по желанию)"
echo "  - пароль ключа (можно тот же, что и у хранилища)"
echo ""

"$JAVA_HOME/bin/keytool" -genkey -v \
  -keystore "$KEYSTORE_PATH" \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias upload

echo ""
echo "Готово. Дальше:"
echo "1. Создайте mobile/android/key.properties по образцу mobile/android/key.properties.example"
echo "2. В key.properties укажите ТЕ ЖЕ пароли, что только что ввели:"
echo "   storePassword=... и keyPassword=... (если при создании ключа ввели тот же пароль — оба одинаковые)"
echo "   keyAlias=upload, storeFile=../upload-keystore.jks"
echo "3. Из папки mobile выполните: ./scripts/build_app_bundle.sh"
echo ""
echo "Важно: храните upload-keystore.jks и пароли в надёжном месте (резервная копия)."
echo "Без них вы не сможете обновлять приложение в Google Play."
