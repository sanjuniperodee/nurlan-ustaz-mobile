#!/bin/bash

# Скрипт для скачивания изображений из Figma
# Использование: ./download_figma_assets.sh

FIGMA_FILE_KEY="iNRKfcXCDGBEolDEQNsLLP"
FIGMA_NODE_ID="33-3228"  # Блок авторизации

# Директории для сохранения
IMAGES_DIR="../mobile/assets/images"
ICONS_DIR="../mobile/assets/icons"

# Создаем директории если их нет
mkdir -p "$IMAGES_DIR"
mkdir -p "$ICONS_DIR"

echo "📥 Загрузка изображений из Figma..."
echo "File Key: $FIGMA_FILE_KEY"
echo "Node ID: $FIGMA_NODE_ID"
echo ""
echo "⚠️  Для скачивания изображений используйте Figma Flutter MCP:"
echo "   mcp_Figma_Flutter_MCP_download_figma_images"
echo ""
echo "Или экспортируйте вручную из Figma:"
echo "   1. Откройте Figma: https://www.figma.com/design/$FIGMA_FILE_KEY/..."
echo "   2. Выберите фрейм с node-id=$FIGMA_NODE_ID"
echo "   3. Экспортируйте изображения в формате PNG/SVG"
echo "   4. Сохраните в $IMAGES_DIR и $ICONS_DIR"
echo ""
echo "Нужные файлы:"
echo "  - Логотип ILM (logo.svg или logo.png)"
echo "  - Иконка полумесяца (crescent.svg или crescent.png)"
echo "  - Иконки социальных сетей (google.svg, apple.svg, facebook.svg)"
echo "  - Иллюстрации для welcome экранов"
