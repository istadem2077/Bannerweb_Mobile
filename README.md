# Bannerweb Mobile
Repository to host and collaborate on CS310 term project

---

## Overview

**Bannerweb Mobile** is a mobile application developed for Sabancı University students to access and manage their academic information directly from their smartphones.
It aims to bring the functionality of the existing desktop-only BannerWeb system into a modern, mobile-friendly platform that allows students to perform key academic tasks on the go.

This project was developed as part of **CS310 – Mobile Application Development** at Sabancı University.

---

## Problem Statement

Sabancı University’s BannerWeb service is only available as a desktop website and is not optimized for mobile devices.
Students face difficulties accessing their academic data and managing tasks efficiently on mobile platforms.
This project addresses that limitation by providing a dedicated mobile application with a simplified and responsive design.

---

## Project Objectives

The main goal of this project is to design and implement a mobile application that replicates and enhances the key features of the existing BannerWeb system.
The application will provide an accessible interface to:

* Register and drop courses
* View grades and transcripts
* Check degree requirements
* Update and view personal information
* Receive notifications about academic events and deadlines

---

## Features

* Full BannerWeb functionality adapted for mobile use
* Easier Add & Drop process
* Readable time schedule and visual timetable
* Faster and more intuitive navigation
* Secure authentication with auto-login
* Cached student information (profile picture, contact info, IBAN, etc.)
* Real-time updates and push notifications

---

## Target Audience

All Sabancı University students who use BannerWeb for academic management.

---

## Technology Stack

* **Platform:** Flutter
* **Language:** Dart
* **IDE:** Visual Studio Code, Vim (developer preference)
* **Version Control:** Git and GitHub

Repository:
[https://github.com/istadem2077/Bannerweb_Mobile](https://github.com/istadem2077/Bannerweb_Mobile)

---

## Data Storage

* Authentication system with optional auto-login
* Local caching of user information for faster access
* Cached chats and messages
* Profile data such as email, phone number, student ID, and IBAN (if available)

---

## Unique Selling Point

Unlike the existing BannerWeb website, **Bannerweb Mobile** provides a fully mobile-optimized experience.
It consolidates all essential academic tools into a single mobile app, improving accessibility, convenience, and user experience.

---

## Challenges

* Secure authentication and session handling
* Reliable Add/Drop implementation with accurate scheduling
* Handling login requests efficiently during high-demand periods (e.g., Add/Drop week)

---

## Contributing

We welcome contributions to improve the functionality, design, and performance of **Bannerweb Mobile**.

1. **Fork** the repository
2. **Create a feature branch**

   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit your changes**

   ```bash
   git commit -m "Add new feature or fix"
   ```
4. **Push to your branch**

   ```bash
   git push origin feature/your-feature-name
   ```
5. **Submit a Pull Request**

Please ensure your contributions follow the project structure and clean coding practices.

---

## License

This project is licensed under the **GNU General Public License v2.0 (GPLv2)**.

You may redistribute and/or modify this code under the terms of the GPLv2 license as published by the Free Software Foundation.

See the [LICENSE](LICENSE) file for more details or visit:
[https://www.gnu.org/licenses/old-licenses/gpl-2.0.html](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

---

## Testing

This project includes **unit and widget tests** to ensure that key features work correctly and that the UI renders as expected.
All tests are implemented using Flutter’s built-in testing framework.

### Running Tests

To run all tests:

```bash
flutter test
```

---

### Test Descriptions

#### 1. Unit Tests

**ThemeProvider Tests** (`test/unit/theme_provider_test.dart`)

* Verifies the default theme is light mode
* Ensures switching to dark mode updates `themeMode` and `isDarkMode`
* Confirms switching back restores the correct state

**AppRoutes Tests** (`test/unit/routes_test.dart`)

* Ensures all routes start with `/`
* Confirms essential routes exist (e.g. `/`, `/home`, `/settings`)
* Verifies route map keys match constants defined in `AppRoutes`

---

#### 2. Widget Tests

**Final Exam Schedule Screen** (`test/widget/final_schedule_screen_test.dart`)

* Tests `FinalExamSchedulePageMock`
* Verifies page title: **“Final Exam Schedule”**
* Confirms `ProfileHeaderCard` renders correctly using `MockAuthProvider`
* Ensures mock exam cards display properly

**Settings Screen** (`test/widget/settings_screen_test.dart`)

* Tests `SettingsPageMock`
* Confirms `ProfileHeaderCard` displays correct student info
* Verifies dark mode toggle updates state correctly
* Ensures logout button is visible and tappable

---

### Testing Approach Notes

* **Mocks:** `MockAuthProvider` is used to avoid Firebase initialization in widget tests
* **SharedPreferences:** Mocked to simulate local storage without disk access
* **UI Validation:** Tests ensure headers, switches, buttons, and list items render correctly

---

## Setup and Installation

### Prerequisites

* Flutter SDK **3.9.2 or higher**
* Dart SDK (included with Flutter)
* Android Studio / Xcode
* Firebase project setup

---

### Installation Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/istadem2077/Bannerweb_Mobile.git
   cd Bannerweb_Mobile
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Firebase Configuration**

   * Firebase options are included in `lib/firebase_options.dart`
   * Android: `android/app/google-services.json`
   * iOS: `ios/Runner/GoogleService-Info.plist`

4. **Run the app**

   ```bash
   flutter run
   ```

---

## Known Limitations and Bugs

* Some features require an active internet connection
* Auto-login may fail on first launch if cache is empty
* Course registration features are still in development
* Some navigation routes are partially implemented

---
