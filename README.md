# Learning Flutter: Build for Multiple Platforms
This is the repository for the LinkedIn Learning course `Learning Flutter: Build for Multiple Platforms`. The full course is available from [LinkedIn Learning][lil-course-url].

ChatWave is a production‑ready, cross‑platform chat application built with Flutter and Firebase (Firestore, Authentication, Cloud Functions, Storage, and FCM). It supports Android, iOS, Web, Windows, macOS, and Linux from a single code base, following a clean MVVM + Repository architecture with Riverpod for state management.

Table of Contents

Demo

Features

Tech Stack

Project Structure

Getting Started

Architecture Deep Dive

State Management

Testing

CI / CD

Deployment

Contributing

Roadmap

License

Credits

Demo

Android

iOS

Web







Try it live: https://chatwave.app (Firebase preview)

Features

🔒 Email / Google / GitHub Authentication (Firebase Auth)

💬 Real‑time messaging with typing indicators & read receipts (Cloud Firestore + Streams)

📷 Media sharing – images, GIFs, documents, voice notes

🌙 Light & Dark themes with dynamic color on Android 12+

📴 Offline persistence & local message queueing

🔔 Push notifications (FCM) with deep‑links to conversations

👥 Group chat – create, rename, add / remove members

🧑‍💻 Profile management – avatar upload & status message

🔍 Search – global & in‑chat message search with highlights

🔄 Message edits & deletes with history retention

🌐 Multi‑platform – Android, iOS, Web, Desktop (Windows, macOS, Linux)

🛡️ End‑to‑end encryption (optional, experimental)

Tech Stack

Layer

Technology

UI

Flutter 3.22 (Material 3)

State Management

Riverpod 2 (+ flutter_hooks)

Backend‑as‑a‑Service

Firebase (Auth, Firestore, Storage, Functions, Cloud Messaging)

Local Storage

hive / shared_preferences

Routing

go_router

CI

GitHub Actions, Very Good Analysis, FVM

Testing

Mockito, flutter_test, integration_test

Code Quality

melos, custom_lints, dart_code_metrics

Key packages (pubspec.yaml):

  flutter_riverpod: ^2.5.0
  firebase_core: ^3.0.0
  firebase_auth: ^5.0.0
  cloud_firestore: ^6.0.0
  firebase_storage: ^12.0.0
  firebase_messaging: ^16.0.0
  flutter_local_notifications: ^17.0.0
  image_picker: ^1.1.1
  file_picker: ^8.0.0
  go_router: ^13.2.0
  intl: ^0.19.0
  mime: ^1.0.4

Project Structure

lib/
 ├── app.dart              # root MaterialApp & theme
 ├── core/                 # shared utils, constants, exceptions
 ├── data/
 │     ├── datasources/    # Firebase / REST implementations
 │     ├── models/         # DTOs & serializers
 │     └── repositories/   # abstraction layer
 ├── domain/               # entities & business logic
 ├── presentation/
 │     ├── routes/         # go_router routes config
 │     ├── view_models/    # Riverpod providers (StateNotifier)
 │     └── pages/          # UI widgets (HomePage, ChatPage, …)
 └── main.dart             # env bootstrap & runApp()

Why this structure? It enforces separation of concerns, improves testability, and keeps UI independent from data sources.

Getting Started

Prerequisites

Flutter SDK ≥ 3.22 – https://flutter.dev/docs/get-started/install

Dart ≥ 3.4 (bundled with Flutter)

Firebase CLI (for project initialization) – npm i -g firebase-tools

Xcode 15+ (macOS) &/or Android Studio Electric Eel+ for platform SDKs

Installation

# 1. Clone the repo
$ git clone https://github.com/<your‑org>/chatwave.git && cd chatwave

# 2. Install dependencies
$ flutter pub get

# 3. Create a Firebase project & download `google-services.json` (Android) + `GoogleService-Info.plist` (iOS)
$ firebase login
$ firebase projects:create chatwave‑prod
$ dart run tool:configure_firebase   # custom helper script

# 4. Run the app
$ flutter run -d <device‑id>

Web: enable Email/Password and Anonymous auth providers in Firebase Console → Authentication.

Environment Variables

Copy .env.example to .env and fill in your Firebase keys:

API_KEY= AIza...           # Web API key
PROJECT_ID= chatwave-prod
MS_APP_CENTER_SECRET= ...  # optional crash reporting

Architecture Deep Dive

Domain Layer → pure Dart models & use‑cases (no Flutter / Firebase imports).

Data Layer → talks to Firebase (Cloud Firestore, Storage, Functions) through typed interfaces.

Presentation Layer → Widgets, Riverpod providers, themes, routes.

Communication flow:

UI → ViewModel(StateNotifier) → UseCase → Repository → DataSource(Firestore)

All streams emitted by repositories are exposed as StreamProvider or AsyncNotifierProvider for the UI to reactively rebuild.

State Management

We picked Riverpod 2 because it offers:

Compile‑time safety with generics & refactor‑friendly names.

Simple dependency injection via ProviderScope.

Declarative, testable APIs (StateNotifier, AsyncNotifier).

Example ChatController (abridged):

class ChatController extends AsyncNotifier<List<Message>> {
  ChatController(this._repo);
  final ChatRepository _repo;

  @override
  Future<List<Message>> build(String chatId) async => _repo.messages(chatId);

  Future<void> send(String chatId, String text) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repo.send(chatId, text));
  }
}

Testing

Unit tests – Pure Dart (domain, utils) › flutter test test/unit

Widget tests – UI interactions (mocked providers) › flutter test test/widget

Integration tests – Runs on real device with Firebase emulators › flutter test integration_test

Static analysis – dart run very_good_analysis:analyze

Continuous Integration runs all of the above on every pull request (see .github/workflows/ci.yml).

CI / CD

GitHub Actions: build → test → lint → upload coverage → create release → deploy

Codemagic (optional): build signed APK / IPA on tag push

Firebase Hosting for web preview (firebase deploy --only hosting:web)

Deployment

Platform

Command

Android (APK)

flutter build apk --split-per-abi

iOS (IPA)

flutter build ipa --release

Web

flutter build web

Windows

flutter build windows

macOS

flutter build macos

Refer to docs/deployment_guide.md for Play Store & App Store submission steps, signing, versioning, and mandatory privacy labels.

Contributing

Fork the repo & create your branch: git checkout -b feature/amazing-feature.

Commit your changes using Conventional Commits.

Run melos run verify to pass all checks.

Open a PR with a clear description & link to any open issues.

Please read CONTRIBUTING.md for detailed code standards, branch naming, and review process.

Roadmap



Feel free to open issues or up‑vote existing ones to influence priorities!

License

This project is licensed under the MIT License – see LICENSE for details.
