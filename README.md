# 시니어 소개팅 앱

시니어 소개팅 앱 빠른 MVP 목표
📎 Link: https://snap-blind.vercel.app/

---

### 앱 빌드
```bash
./app_build.sh
```

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
