#!/bin/bash

set -e
export PATH="$PATH:$PWD/flutter/bin"

# 옵션 파싱
if [[ "$1" == "--clean" ]]; then
  echo "🧹 Running flutter clean..."
  flutter clean
fi

# build_runner 실행
echo "🔧 Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

# dart fix 자동 적용
echo "🧼 Running dart fix..."
dart fix --apply

echo "✅ Done!"