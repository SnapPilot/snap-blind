#!/bin/bash

# build_runner 실행
echo "🔧 Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

# dart fix 자동 적용
echo "🧼 Running dart fix..."
dart fix --apply

echo "✅ dart fix Done!"

flutter build web --release \
  --dart-define=SUPABASE_HOST_URL=$SUPABASE_HOST_URL \
  --dart-define=SUPABASE_API_KEY=$SUPABASE_API_KEY

echo "✅ Done! Output: build/web"