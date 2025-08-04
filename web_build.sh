#!/bin/bash

flutter/bin/flutter build web --release

# build_runner 실행
echo "🔧 Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

# dart fix 자동 적용
echo "🧼 Running dart fix..."
dart fix --apply

echo "✅ Done!"