# 📱 Flutter Project Architecture

A scalable and modular Flutter starter project built with **GetX**, **Clean Architecture**, and **Material 3**. Designed for production-ready mobile apps with built-in state management, theming, and asset generation.

---

## ✨ Overview

This template gives you:

✅ Folder structure that scales  
✅ Clean separation of concerns  
✅ Easy-to-manage state with GetX  
✅ Modern Material 3 theming system  
✅ Reusable network layer  
✅ Localization support (i18n)  

---

## 🚀 Features

- ⚙️ **GetX**: Routing, State Management, and Dependency Injection
- 🎨 **Material 3**: Modern design system with light/dark themes
- 🌐 **HTTP API Integration**
- 🌍 **JSON Localization** with auto key generation (`get generate locales`)
- 🎯 **Resource Management** via organized color and text styles
- 📷 **Auto-generated Image Constants** via `AppImages`

---

## 🧱 Architecture

```
lib/
├── app/
│   ├── core/              
│   │   ├── config/        # App configuration
│   │   ├── resources/     # Colors, themes, text styles
│   │   ├── localization/  # Language support
│   │   └── values/        # Constants and enums
│   ├── data/              # Models, repositories, network
│   ├── modules/           # Feature-based structure (UI + logic)
│   ├── routes/            # GetX named routes
│   └── binding/           # Dependency injection bindings
├── assets/
│   ├── images/            # App images & icons
│   └── locales/           # Translation files (en_US, etc.)
├── tool/
│   └── build_resources.dart    # Script for generating images + moving locales
```

---

## 🎨 Theme System

The project uses a modern Material 3 theme system with:

### Color System (`AppColors`)

```dart
// Brand Colors
final primary = const Color(0xFF4A90E2);
final secondary = const Color(0xFF50E3C2);

// Base Colors
final white = Colors.white;
final black = Colors.black;
final grey = const Color(0xFF9E9E9E);

// Background Colors
final background = Colors.white;
final darkBackground = const Color(0xFF121212);
final surface = const Color(0xFFF5F5F5);

// Text Colors
final textPrimary = const Color(0xFF212121);
final textSecondary = const Color(0xFF757575);
final darkText = Colors.white;

// Status Colors
final error = const Color(0xFFE53935);
final success = const Color(0xFF43A047);
final warning = const Color(0xFFFFA000);
final info = const Color(0xFF1976D2);

// UI Elements
final divider = const Color(0xFFE0E0E0);
final inputBorder = const Color(0xFFBDBDBD);
final disabled = const Color(0xFFBDBDBD);
```

### Theme Configuration (`AppThemeData`)

```dart
ThemeData get light => ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: _colors.primary,
  scaffoldBackgroundColor: _colors.background,
  
  colorScheme: ColorScheme(
    primary: _colors.primary,
    secondary: _colors.secondary,
    // ... other colors
  ),

  textTheme: TextTheme(
    displayLarge: AppTextTheme().headline1,
    bodyLarge: AppTextTheme().bodyText1,
    labelLarge: AppTextTheme().button,
  ),

  // ... other theme configurations
);
```

Usage in code:
```dart
final colors = AppColors();
Text('Hello', style: TextStyle(color: colors.textPrimary));
Container(color: colors.surface);
```

---

## ⚙️ Technologies Used

- Flutter 3.x
- GetX (state + DI + routing)
- Material 3
- HTTP client

---

## 🛠 Setup Instructions

### 1. Clone and install dependencies

```bash
git clone https://github.com/adkdeve/flutter_efficient_architecture.git
cd flutter_efficient_architecture
flutter pub get
```

### 2. Run resource generators

```bash
dart tool/build_resources.dart
```

This will:
* ✅ Generate `AppImages` from `assets/images`
* ✅ Move `locales.g.dart` to `lib/app/core/localization`
* ✅ Remove `lib/generated/`

---

## 🧩 GetX CLI Commands

```bash
flutter pub global activate get_cli
```

| Command                               | Description                             |
| ------------------------------------- | --------------------------------------- |
| `get create page:login`               | Full module (view, controller, binding) |
| `get create controller:auth`          | Generate only controller                |
| `get generate locales assets/locales` | Create localization Dart file from JSON |

---

## 📸 Image Assets

Auto-generate image keys from `/assets/images/`:

```bash
dart tool/generate_app_images.dart
```

Use in code:

```dart
Image.asset(R.image.img_logo);
SvgPicture.asset(R.image.ic_arrow_back);
```

---

## 🌍 Localization

Translate UI with:

```json
// assets/locales/en_US.json
{
  "login": "Login",
  "welcome_back": "Welcome Back!"
}
```

Then:

```dart
Text(LocaleKeys.welcome_back.tr);
```

Regenerate Dart translation map:

```bash
get generate locales assets/locales
```

---

## 👨‍💻 Author

* **Muhammad Ali** – Flutter Architect
* 📧 [alee0066.aka@gmail.com](mailto:alee0066.aka@gmail.com)

* **Muhammad Asad** – Flutter Architect
* 📧 [asaddq518@gmail.com](mailto:asaddq518@gmail.com)

---
