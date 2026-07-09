# 💪 1Life Gym - Fitness Tracking Application

> A modern Flutter-based fitness companion app that helps you track your health metrics and manage your gym journey with ease.

---

## 📋 Table of Contents

- [About the App](#about-the-app)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [App Architecture](#-app-architecture)
- [Installation & Setup](#-installation--setup)
- [Project Structure](#-project-structure)
- [How to Use](#-how-to-use)
- [Screenshots & Flow](#-screenshots--flow)
- [Firebase Integration](#-firebase-integration)
- [Future Enhancements](#-future-enhancements)
- [Contributors](#-contributors)

---

## 📱 About the App

**1Life Gym** is a comprehensive fitness tracking application designed to help users monitor their physical health metrics. Whether you're just starting your fitness journey or you're a seasoned gym-goer, this app provides an intuitive interface to track your BMI (Body Mass Index) and maintain a personal health record.

**Tagline:** *"Your Personal Fitness Companion"*

---

## ⭐ Features

### 🔐 Authentication
- **User Registration**: Create new account with email and password
- **User Login**: Secure login with Firebase Authentication
- **Session Management**: Keep track of login sessions
- **Logout**: Safely logout from your account

### 📊 BMI Tracking
- **BMI Calculator**: Calculate BMI by entering height (cm) and weight (kg)
- **Health Status**: Get instant health status based on BMI:
  - 🔵 Underweight (< 18.5)
  - 🟢 Normal (18.5 - 24.9)
  - 🟠 Overweight (25 - 29.9)
  - 🔴 Obese (≥ 30)
- **History Tracking**: View all your BMI records in reverse chronological order
- **Real-time Updates**: Automatically synced with Firebase database

### 👤 User Dashboard
- Personalized welcome message with user email
- Quick access to contact information
- Easy navigation to BMI calculator

### 📞 Contact Information
- Gym phone number: **1717179999**
- Email: **1lifegym@gmail.com**

---

## 🛠️ Tech Stack

```
┌─────────────────────────────────────────────────────┐
│           1Life Gym Tech Stack                       │
├─────────────────────────────────────────────────────┤
│                                                      │
│  Frontend:                                           │
│  ├─ Flutter 3.0+                                    │
│  └─ Dart                                            │
│                                                      │
│  Backend & Database:                                │
│  ├─ Firebase Core                                  │
│  ├─ Firebase Authentication                        │
│  └─ Cloud Firestore                                │
│                                                      │
│  Architecture:                                       │
│  └─ Multi-Platform Support (iOS, Android, Linux)   │
│                                                      │
└─────────────────────────────────────────────────────┘
```

### Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | Latest | UI Framework |
| `firebase_core` | ^3.6.0 | Firebase initialization |
| `firebase_auth` | ^5.3.1 | User authentication |
| `cloud_firestore` | ^5.4.4 | Real-time database |

---

## 🏗️ App Architecture

```
┌────────────────────────────────────────────────────────┐
│                   Home Page                            │
│         (Register / Login Navigation)                  │
└────────────────┬───────────────────────────────────────┘
                 │
        ┌────────┴────────┐
        │                 │
        ▼                 ▼
    ┌────────┐        ┌────────┐
    │Register│        │ Login  │
    └────────┘        └────┬───┘
        │                  │
        └──────────┬───────┘
                   │
                   ▼
            ┌─────────────┐
            │  Dashboard  │
            └──────┬──────┘
                   │
        ┌──────────┴──────────┐
        │                     │
        ▼                     ▼
    ┌────────────┐      ┌───────────┐
    │BMI Screen  │      │  Logout   │
    └────────────┘      └───────────┘
         │
         ├─ Calculate BMI
         ├─ View History
         └─ Save to Firebase
```

---

## 🚀 Installation & Setup

### Prerequisites
- **Flutter SDK** (3.0 or higher)
- **Dart** (included with Flutter)
- **Firebase Account** with a project created
- **Git** for version control

### Step 1: Clone the Repository
```bash
git clone https://github.com/anuragg17/MADL_Project.git
cd MADL_Project
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Configure Firebase
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create/Select your project
3. Add a Flutter app to your project
4. Download the configuration files and add them to your project

### Step 4: Run the App
```bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios

# For Web
flutter run -d chrome

# For Linux
flutter run -d linux
```

---

## 📁 Project Structure

```
MADL_Project/
│
├── lib/
│   └── main.dart                 # Main application file with all screens
│
├── linux/                        # Linux platform configuration
│   ├── runner/                   # GTK runner implementation
│   └── flutter/                  # Flutter engine configuration
│
├── ios/                          # iOS platform configuration
│
├── android/                      # Android platform configuration
│
├── pubspec.yaml                  # Project dependencies
│
├── README.md                     # Project documentation
│
└── .gitignore                    # Git ignore file
```

### Key Screens in `main.dart`

| Screen | Purpose |
|--------|---------|
| **MyApp** | App entry point with MaterialApp config |
| **GymHomePage** | Initial home screen with Register/Login buttons |
| **RegisterScreen** | New user registration screen |
| **LoginScreen** | Existing user login screen |
| **Dashboard** | User dashboard after login |
| **BMIScreen** | BMI calculation and history tracking |

---

## 📖 How to Use

### 1️⃣ First-Time User (Registration)
```
Home Page → Click "Register" → Enter Email & Password → Create Account
```

### 2️⃣ Returning User (Login)
```
Home Page → Click "Login" → Enter Email & Password → Access Dashboard
```

### 3️⃣ Track Your BMI
```
Dashboard → Double-tap "BMI Calculator" → Enter Height & Weight 
→ Click "Calculate BMI" → View Results & History
```

### 4️⃣ View BMI History
```
BMI Screen → Scroll down → See all previous BMI records
(Sorted from newest to oldest)
```

### 5️⃣ Logout
```
Dashboard → Click "Logout" → Return to Home Page
```

---

## 🎨 Screenshots & Flow

### User Flow Diagram
```
START
  │
  ├─► Home Page
  │    ├─► [Register] ──► Register Screen ──► Firebase Auth ──┐
  │    └─► [Login]    ──► Login Screen    ──► Firebase Auth ──┤
  │                                                            │
  └────────────────────────────────────────────────────────────┤
                                                               │
                                          ┌────────────────────┘
                                          ▼
                                    Dashboard
                                    (Welcome + Contact Info)
                                          │
                                          ├─► [Double-tap BMI]
                                          │       │
                                          │       ├─► Input Height & Weight
                                          │       ├─► Calculate BMI
                                          │       ├─► Show Result + Status
                                          │       └─► Save to Firestore
                                          │
                                          └─► [Logout] ──► Home Page
```

### BMI Health Status Color Legend
```
🔵 Blue    → Underweight (BMI < 18.5)
🟢 Green   → Normal Weight (BMI 18.5 - 24.9)
🟠 Orange  → Overweight (BMI 25 - 29.9)
🔴 Red     → Obese (BMI ≥ 30)
```

---

## 🔥 Firebase Integration

### Database Structure
```
Firestore Database
│
└── users/ (collection)
    │
    └── {userId}/ (document)
        │
        └── bmi_records/ (subcollection)
            │
            └── {recordId} (document)
                ├── bmi: double
                ├── height: double
                ├── weight: double
                └── time: timestamp
```

### Authentication Flow
```
┌──────────────┐
│ Email & Pass │
└──────┬───────┘
       │
       ▼
┌─────────────────────────┐
│ Firebase Authentication │
├─────────────────────────┤
│ ✓ Registration          │
│ ✓ Login                 │
│ ✓ Session Management    │
└──────────┬──────────────┘
           │
           ▼
    ┌──────────────┐
    │ User Session │
    └──────────────┘
```

---

## 💡 Future Enhancements

- [ ] **Progress Charts**: Visual BMI trend graphs and statistics
- [ ] **Goal Setting**: Set and track personal fitness goals
- [ ] **Workout Plans**: Personalized workout routines based on BMI
- [ ] **Social Sharing**: Share achievements with friends
- [ ] **Push Notifications**: Reminders for fitness activities
- [ ] **Dark Mode**: Dark theme support
- [ ] **Offline Support**: Work offline with sync capability
- [ ] **Calorie Tracker**: Track daily calorie intake
- [ ] **Profile Customization**: User profile with avatar
- [ ] **Multi-language Support**: Support for multiple languages

---

## 📸 App Screenshots

### Key Screens Overview

```
┌─────────────┐   ┌─────────────┐   ┌─────────────┐
│ Home Page   │   │ Login/Reg   │   │ Dashboard   │
├─────────────┤   ├─────────────┤   ├─────────────┤
│ 1Life Gym   │   │ Email Input  │   │ Welcome!    │
│ [Register]  │───│ Pass Input   │───│ [BMI Calc]  │
│ [Login]     │   │ [Submit]    │   │ [Logout]    │
└─────────────┘   └─────────────┘   └─────────────┘
                                           │
                                           │
                                           ▼
                                    ┌─────────────┐
                                    │ BMI Screen  │
                                    ├─────────────┤
                                    │ Height/Wt   │
                                    │ [Calculate] │
                                    │ History ▼   │
                                    └─────────────┘
```

---

## 🔐 Security Features

✅ **Firebase Authentication**: Secure user login/registration  
✅ **Data Encryption**: Cloud Firestore encrypted at rest  
✅ **User Privacy**: Personal data protected and isolated per user  
✅ **Session Management**: Automatic session handling  

---

## 📝 Getting Started with Code

### Main Entry Point
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase with your project credentials
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      // Your Firebase credentials here
    ),
  );
  
  runApp(const MyApp());
}
```

### BMI Calculation Formula
```
BMI = Weight (kg) / (Height (m))²

Example: 
- Height: 170 cm (1.70 m)
- Weight: 70 kg
- BMI = 70 / (1.70 × 1.70) = 24.22 (Normal)
```

---

## 🤝 Contributing

Contributions are welcome! Feel free to:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📞 Support & Contact

For issues, suggestions, or support:
- **Email**: 1lifegym@gmail.com
- **Phone**: 1717179999
- **GitHub Issues**: [Open an issue](https://github.com/anuragg17/MADL_Project/issues)

---

## 📄 License

This project is open-source and available under the MIT License.

---

## 👨‍💻 Developer

**Anurag Gupta**  
GitHub: [@anuragg17](https://github.com/anuragg17)  
Project: [MADL_Project](https://github.com/anuragg17/MADL_Project)

---

## 🌟 Show Your Support

If you found this project helpful, please consider giving it a ⭐ on GitHub!

---

**Last Updated**: July 2026  
**Version**: 1.0.0  
**Status**: Active Development
