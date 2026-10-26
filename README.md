<div align="center">

  <img src="assets/images/splash_screen_light.png" alt="Sarraf splash screen" width="220">

  # Sarraf

  ### A modern, bilingual currency converter built with Flutter

  Convert currencies in seconds with live exchange rates, a clean interface, and light and dark themes.

  <p>
    <img src="https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white" alt="Flutter">
    <img src="https://img.shields.io/badge/Dart-3.13%2B-0175C2?logo=dart&logoColor=white" alt="Dart">
    <img src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-0A7D61" alt="Platforms">
    <img src="https://img.shields.io/badge/License-Private-lightgrey" alt="License">
  </p>

</div>

---

## Overview

Sarraf is a Flutter mobile application for converting between currencies using the
[ExchangeRate-API](https://www.exchangerate-api.com/). The app provides a focused
conversion flow: select the source and target currencies, enter an amount, and
get the converted value using the latest available rates.

## Features

- **Live exchange rates** loaded from ExchangeRate-API.
- **Currency conversion** using the selected source and target currencies.
- **Wide currency catalog** with currency names, codes, and symbols.
- **Bilingual experience** with English (`en-US`) and Arabic (`ar-EG`) localization.
- **Light and dark themes** with a settings screen for appearance preferences.
- **Responsive layout** using `flutter_screenutil_plus`.
- **Platform-ready branding** with custom Android and iOS app icons.
- **Splash screen configuration** for light, dark, and Android 12+ launch experiences.
- **Network logging in debug mode** through `pretty_dio_logger`.

## Branding

| Light launch screen | Dark launch screen |
|:---:|:---:|
| <img src="assets/images/splash_screen_light.png" alt="Light launch screen" width="180"> | <img src="assets/images/splash_screen_dark.png" alt="Dark launch screen" width="180"> |

> Product screenshots can be added here as the UI evolves.

## Tech Stack

| Area | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| HTTP client | Dio |
| API | ExchangeRate-API |
| State and theme | `flutter_bloc` / `bloc` |
| Localization | `easy_localization` |
| Responsive UI | `flutter_screenutil_plus` |
| SVG rendering | `flutter_svg` |
| Logging | `pretty_dio_logger` |

## Requirements

- Flutter SDK compatible with Dart `3.13.1` or later within the declared SDK range.
- Android Studio and an Android SDK for Android builds.
- Xcode and CocoaPods for iOS development on macOS.
- A valid ExchangeRate-API key.

Check your local Flutter installation with:

```bash
flutter doctor
```

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Amr4924/Sarraf.git
cd Sarraf
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure the API

The API base URL is defined in:

```text
lib/core/constants/api_constants.dart
```

The current endpoint uses the `latest/USD` route. Replace the API key with your
own key before distributing the application.

> **Security note:** API keys embedded in a mobile application can be extracted
> from a built APK or IPA. For production, restrict the key in the provider
> dashboard or proxy requests through a secure backend. Do not commit private
> or unrestricted credentials.

### 4. Run the application

```bash
flutter run
```

To run on a specific device:

```bash
flutter devices
flutter run -d <device-id>
```

## Build

### Android release

The Android release manifest includes the Internet permission required by the
exchange-rate API:

```bash
flutter build apk --release
```

The generated APK is placed at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

### iOS release

On macOS:

```bash
flutter build ios --release
```

Before publishing to the App Store, configure signing, bundle identifiers,
certificates, and provisioning profiles in Xcode.

## Project Structure

```text
lib/
├── core/
│   ├── Network/              # Dio client and network configuration
│   ├── constants/            # API and route constants
│   ├── helpers/              # Shared layout helpers
│   ├── routing/              # Application routes
│   └── theming/              # Colors, typography, and themes
├── feature/
│   ├── home/
│   │   ├── data/             # Currency models and rate conversion
│   │   ├── services/         # Home API service
│   │   └── ui/               # Converter screen and widgets
│   └── settings/
│       ├── logic/            # Theme state management
│       └── ui/               # Settings screen and controls
├── main.dart                 # Application entry point
└── sarraf_app.dart           # Root Material application

assets/
├── images/                   # Splash and image assets
├── svgs/                     # Platform and brand SVG assets
└── translations/             # English and Arabic localization files
```

## API Flow

1. `ApiManager` creates the Dio client with the configured base URL.
2. `HomeServices` requests the latest rates for the selected base currency.
3. `CurrencyRatesModel` parses the API response.
4. The home screen converts the entered amount using the selected currencies.

The default request is equivalent to:

```text
GET https://v6.exchangerate-api.com/v6/<API_KEY>/latest/USD
```

## Quality Checks

Run static analysis:

```bash
flutter analyze
```

Run the test suite:

```bash
flutter test
```

Format Dart files before opening a pull request:

```bash
dart format .
```

## Localization

Translations are stored in:

```text
assets/translations/en-US.json
assets/translations/ar-EG.json
```

When adding a new localized string:

1. Add the key to both translation files.
2. Use the same key in the widget with `tr(...)`.
3. Verify both locales from the Settings screen.

## Contributing

1. Create a focused feature branch:

   ```bash
   git switch -c feature/<short-description>
   ```

2. Keep changes scoped and follow the existing feature-based structure.
3. Run `dart format .`, `flutter analyze`, and relevant tests.
4. Write a clear commit message describing the user-facing change.
5. Open a pull request with validation steps and screenshots for UI changes.

## Roadmap

- Add a user-facing loading, empty, and error state for rate requests.
- Move API credentials to a safer runtime configuration or backend proxy.
- Add automated unit tests for response parsing and conversion calculations.
- Add widget tests for currency selection, input validation, and theme changes.
- Add offline caching for the most recently fetched rates.

## Copyright and Usage Restrictions

Copyright (c) 2026 Amr Saad. All rights reserved.

Sarraf, including its source code, application name, visual identity, designs,
user interface, icons, images, translations, documentation, and other included
assets, is proprietary work owned by the copyright holder.

This repository is **not open source** and is **not licensed for commercial use**.
No person or organization may, without prior written permission from the
copyright holder:

- use the project or any part of it for commercial purposes;
- copy, reproduce, modify, adapt, or create derivative works;
- publish, redistribute, sublicense, sell, or include it in another product;
- use the Sarraf name, branding, icons, designs, or assets;
- use the source code or assets in a paid service, application, or product.

Personal, educational, and internal evaluation use is allowed only with
appropriate attribution and only if it does not involve commercial
distribution or monetization. This permission does not transfer ownership or
grant any license to publish or redistribute the project.

For any commercial use, redistribution, partnership, licensing request, or other
permission, contact the copyright holder and obtain explicit written approval
before using the project:

**Copyright holder:** Amr Saad
**Permission required:** Yes, for any commercial use or redistribution

No rights are granted except those explicitly stated above.

---

<div align="center">
  Built with Flutter for fast, simple currency conversion.
</div>
