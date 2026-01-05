# Bannerweb Mobile
Repository to host and collaborate on CS310 term project
# Bannerweb Mobile

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

- Register and drop courses  
- View grades and transcripts  
- Check degree requirements  
- Update and view personal information  
- Receive notifications about academic events and deadlines

---

## Features
- Full BannerWeb functionality adapted for mobile use  
- Easier Add & Drop process  
- Readable time schedule and visual timetable  
- Faster and more intuitive navigation  
- Secure authentication with auto-login  
- Cached student information (profile picture, contact info, IBAN, etc.)  
- Real-time updates and push notifications  

---

## Target Audience
All Sabancı University students who use BannerWeb for academic management.

---

## Technology Stack
- **Platform:** Flutter  
- **Language:** Dart  
- **IDE:** Visual Studio Code, Vim (developer preference)  
- **Version Control:** Git and GitHub  

Repository: [https://github.com/istadem2077/Bannerweb_Mobile](https://github.com/istadem2077/Bannerweb_Mobile)

---

## Data Storage
- Authentication system with optional auto-login  
- Local caching of user information for faster access  
- Cached chats and messages  
- Profile data such as email, phone number, student ID, and IBAN (if available)

---

## Unique Selling Point
Unlike the existing BannerWeb website, **Bannerweb Mobile** provides a fully mobile-optimized experience.  
It consolidates all essential academic tools into a single mobile app, improving accessibility, convenience, and user experience.

---

## Challenges
- Secure authentication and session handling  
- Reliable Add/Drop implementation with accurate scheduling  
- Handling login requests efficiently during high-demand periods (e.g., Add/Drop week)

---

## Contributing
We welcome contributions to improve the functionality, design, and performance of **Bannerweb Mobile**.  
To contribute:

1. **Fork** the repository.  
2. **Create a feature branch:**  
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Commit your changes:**
   ```bash
   git commit -m "Add new feature or fix"
   ```
4. **Push to your branch:**
   ```bash
   git push origin feature/your-feature-name
   ```
5. **Submit a Pull Request to the main repository.**
   Please ensure your contributions follow the project’s structure and adhere to clean coding practices.

---

## License
This project is licensed under the **GNU General Public License v2.0 (GPLv2)**.  
You may redistribute and/or modify this code under the terms of the GPLv2 license as published by the Free Software Foundation.  

See the [LICENSE](LICENSE) file for more details or visit  
[https://www.gnu.org/licenses/old-licenses/gpl-2.0.html](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

---

## Testing

This project includes **unit and widget tests** to ensure that key features work correctly and the UI renders as expected. All tests can be run using Flutter’s built-in test framework.

### Running Tests
To run all tests in the project:

```bash
flutter test
```

### Test Descriptions

#### 1. Unit Tests

* **ThemeProvider Tests (`test/unit/theme_provider_test.dart`)**: Verifies that the `ThemeProvider` correctly toggles between light and dark modes and updates its state properly.
* Ensures initial theme mode is light.
* Verifies that switching to dark mode updates `themeMode` and `isDarkMode`.
* Confirms switching back to light mode restores the state.


* **AppRoutes Tests (`test/unit/routes_test.dart`)**: Ensures that all routes in the app are valid and correctly defined.
* Validates that all routes start with `/`.
* Confirms essential routes such as `/` (login), `/home`, and `/settings` exist.
* Verifies the route map keys match the constants defined in `AppRoutes`.



#### 2. Widget Tests

* **Final Exam Schedule Screen (`test/widget/final_schedule_screen_test.dart`)**: Tests `FinalExamSchedulePageMock` (mock version of the final exam schedule page) to verify UI rendering.
* Checks for the presence of the page title: "Final Exam Schedule".
* Verifies the rendering of `ProfileHeaderCard` with student information from `MockAuthProvider`.
* Ensures proper display of mock exam cards.


* **Settings Screen (`test/widget/settings_screen_test.dart`)**: Tests `SettingsPageMock` (mock version of the settings page) to ensure interactive elements function correctly.
* Confirms presence of `ProfileHeaderCard` with correct student information.
* Verifies the dark mode switch toggles correctly and updates the mock state.
* Checks that the logout button is visible and responds to taps.



---

### Testing Approach Notes

* **Mocks**: `MockAuthProvider` is used to simulate authentication data for widget tests, removing the need for Firebase initialization during testing.
* **SharedPreferences**: Mocked in tests to simulate local storage without writing to disk.
* **UI Checks**: Tests confirm that important UI components like headers, buttons, switches, and list items render correctly.


