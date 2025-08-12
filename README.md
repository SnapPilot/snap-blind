# 시니어 소개팅 앱


**Flutter: 3.29.0** <br>
**Dart: 3.7.0 < 4.0.0** <br>

시니어 소개팅 앱 빠른 MVP 목표 <br>
📎 Link: https://snap-blind.vercel.app/

---

### 앱 빌드
```bash
./app_build.sh
```

### 웹 빌드

<img width="903" height="680" alt="스크린샷 2025-08-12 오후 6 05 32" src="https://github.com/user-attachments/assets/8ebaee4a-1792-4224-9e8b-8c5a3d315b18" />

Additional run args<br>
--dart-define=SUPABASE_HOST_URL=값 --dart-define=SUPABASE_API_KEY=값

Flutter 캐시 삭제 후 빌드
```bash
./app_build.sh --clean
```
---

### ❄️ 프로젝트 구조

```
lib          
├── core/
│   ├── error
│   ├── logger
│   ├── di
│   └── routes
├── data
│   └─ feature (단위 폴더링)
│       ├── repository
│       ├── data_source
│       └── dto
├── domain
│   └─ feature (단위 폴더링)
│       ├── entity
│       ├── repository
│       └── use_case (필요시)
├── presenter
│   ├── base
│   ├── constants
│   ├── enums
│   ├── theme
│   ├── utils
│   ├── widgets
│   └── routes.dart
└── main.dart
```

---

### 웹 배포 Vercel

<img width="720" height="511" alt="Image" src="https://github.com/user-attachments/assets/c15e5ca2-0d26-490d-93b9-400d193b16be" />

---
