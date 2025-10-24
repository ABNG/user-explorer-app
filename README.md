# User Explorer

## Overview

**User Explorer** is a Flutter application built as part of a technical test.  
It demonstrates a clean, scalable architecture for fetching and displaying a list of users from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/).  
The app emphasizes maintainability, modularity, and testability — following Flutter best practices.

---

## Features

- Fetch and display a list of users from a REST API.
- Navigate to a **User Detail Screen** with full information.
- Graceful handling of **loading**, **error**, and **empty** states.
- Follows **Clean Architecture** principles.
- Uses **Cubit (flutter_bloc)** for state management.
- Built with **Dio** for network requests and **Injectable + GetIt** for dependency injection.

---

## Screens

### User List Screen
Displays a scrollable list of users fetched from the API with:
- Pull-to-refresh functionality.
- Loading and error indicators.
- Smooth navigation to the detail screen.

### User Detail Screen
Displays detailed information about the selected user:
- Name, email, phone number.
- Address and company details.

---

### Architecture

The project follows a **layer-first (Clean Architecture)** structure:

lib/
├── core/
│ ├── di/ # Dependency Injection setup
│ ├── error/ # AppException handling
│ └── manager/ # Configuration & interceptors & bloc observer
├── data/
│ ├── model/ # Data models
│ ├── repository/ # Repository implementation
│ └── service/ # Remote data source (API service)
├── domain/
│ └── repository/ # Abstract repository contracts
├── presentation/
│ ├── cubit/ # Business logic using Cubit
│ └── screen/ # UI Screens (List, Detail)
│ └── widget/ # Reusable UI components
└── main.dart # App entry point

---

### Setup and Installation

**Requirements**:

- Flutter SDK
- Dart SDK

**Steps**:

1.  **Clone the Repository**:

    ```bash
    git clone <your-repository-url>
    cd user_explorer
    ```

2.  **Install Dependencies**:

    ```bash
    flutter clean && flutter pub get
    ```

3.  **Generate Dependency Injection Files**:

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the App**:

    ```bash
    flutter run
    ```
