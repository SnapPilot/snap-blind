#!/usr/bin/env bash
set -euo pipefail

export PATH="$PWD/flutter/bin:$PATH"

echo "📦 flutter pub get"
flutter pub get

echo "🔧 Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "🧼 Running dart fix..."
dart fix --apply || true

echo "🚀 Building web..."
flutter build web --release \
  --dart-define=SUPABASE_HOST_URL="$SUPABASE_HOST_URL" \
  --dart-define=SUPABASE_API_KEY="$SUPABASE_API_KEY"

echo "✅ Done! Output: build/web"