# 💬 Flutter Chat App

A modern real-time chat application built using **Flutter** and **Firebase**. The app supports user authentication, one-to-one messaging, and follows a clean, scalable architecture.

## ✨ Features

### 🚀 Onboarding
- Introductory onboarding screen for first-time users.
- Smooth transition into registration or login flow.

### 🔐 Authentication
- **Register** and **Login** using **Firebase Authentication**.
- Persistent user session with automatic login handling.

### 👥 All Users Screen
- Displays a list of all registered users.
- Tap any user to start a one-on-one chat.

### 💬 Chat Screen
- Real-time one-to-one messaging.
- Messages stored and synced using **Cloud Firestore**.
- Supports instant message updates.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Dart
- Firebase Project (with Authentication & Firestore enabled)
- Android Studio or VS Code

### Installation

```bash
git clone https://github.com/AmirKhairy/chat-app.git
cd chat-app
flutter pub get
```

### Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Enable **Email/Password** in **Authentication**
4. Enable **Cloud Firestore** in **Build > Firestore Database**
5. Download `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS)
6. Replace your local configuration files and ensure `firebase_options.dart` is generated using:

```bash
flutterfire configure
```

---

## 📁 Project Structure

```
lib/
│
├── core/
│   ├── services/       # Firebase and navigation services
│   └── utils/          # Constants, themes, helper functions
│
├── data/
│   └── models/         # User and chat message models
│
├── presentation/
│   ├── blocs/          # Cubits or BLoC state management
│   ├── views/          # Screens: onboarding, auth, chat, user list
│   └── widgets/        # Reusable UI components
│
├── firebase_options.dart
└── main.dart           # App entry point
```

---

## 🔌 Firebase Integration

- **Authentication**: Secure login and registration using Firebase Auth (Email/Password).
- **Cloud Firestore**: Real-time database for user profiles and messages.
- **Firebase Core**: Initialization and configuration via `firebase_options.dart`.

---

## 🧾 License

This project is licensed under the **MIT License**.

---

## 🙋‍♂️ Author

**Amir Khairy Khalil**  
- 💼 LinkedIn: [Amir Khairy](https://www.linkedin.com/in/amir-khairy-35ba06291/)  
- 💻 GitHub: [AmirKhairy](https://github.com/AmirKhairy)
