# Mock Mate AI
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/AYAEMAD0/graduation_project)

Mock Mate AI is an intelligent, cross-platform interview preparation tool built with Flutter. It leverages AI to provide a realistic and personalized interview experience, helping users practice and improve their skills for technical roles. The application simulates real-world interview scenarios, including timed Multiple-Choice Questions (MCQs) and interactive coding challenges, complete with a functional code editor.

## Key Features

*   **Personalized Interview Sessions**: Generates customized interview questions by analyzing an uploaded CV and job description. Supports both standard database-driven questions and dynamic AI-generated questions.
*   **Realistic Interview Simulation**: Engages users in timed sessions with a mix of MCQs and coding problems to mimic the pressure of a real interview.
*   **Integrated Coding Workspace**: A full-featured code editor within the app that supports multiple languages (including C++, Java, Python, C#), allowing users to write, run, and submit code against predefined test cases.
*   **AI-Powered Feedback**: Delivers comprehensive performance analysis after each session, highlighting strengths, weaknesses, and providing actionable suggestions for improvement.
*   **Interview History & Progress Tracking**: Users can review their past interview sessions, scores, and detailed feedback to monitor their progress over time.
*   **Responsive UI**: A single codebase provides a tailored experience for both web and mobile platforms.

## Tech Stack & Architecture

This project is built using Clean Architecture principles to ensure a scalable, maintainable, and testable codebase.

*   **Framework**: Flutter
*   **State Management**: `flutter_bloc` for managing application state in a predictable way.
*   **Architecture**: Clean Architecture, with a clear separation of concerns into three main layers:
    *   **Domain**: Contains the core business logic, including entities, use cases, and repository interfaces.
    *   **Data**: Implements the repositories defined in the domain layer and manages data sources (both remote and local).
    *   **Presentation (Features)**: Holds all UI-related components, including screens, widgets, and BLoCs/Cubits that connect the UI to the business logic.
*   **Dependency Injection**: `get_it` and `injectable` are used to manage dependencies throughout the application.
*   **Networking**: `dio` is used for making HTTP requests to the backend API, with a `PrettyDioLogger` for debugging and an interceptor for handling authentication tokens.
*   **Routing**: A centralized routing system (`AppRouter`) manages navigation within the app.
*   **Local Storage**: `shared_preferences` for non-sensitive data and `flutter_secure_storage` for securely storing authentication tokens.

## Project Structure

The `lib` directory is organized according to Clean Architecture principles:

```
lib/
├── api/             # API service definitions, DTOs, and data source implementations
├── core/            # Shared components: theming, routing, constants, custom widgets, etc.
├── data/            # Repository implementations and data source interfaces
├── domain/          # Core business logic: entities, use cases, and repository interfaces
└── features/        # Presentation layer: screens, view models (Cubits), and feature-specific widgets
    ├── auth/        # Authentication screens (Login, Signup, Forgot Password)
    ├── feedback/    # Post-interview feedback screen
    ├── main/        # Main app layout with tabs (Home, History, Profile)
    ├── onboarding/  # Onboarding flow for new users
    └── session/     # Core interview experience (CV upload, question overview, coding/MCQ workspaces)
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

*   Flutter SDK: Make sure you have the Flutter SDK installed on your machine. You can find instructions at [flutter.dev](https://flutter.dev).

### Installation

1.  **Clone the repository**
    ```sh
    git clone https://github.com/ayaemad0/graduation_project.git
    ```
2.  **Navigate to the project directory**
    ```sh
    cd graduation_project
    ```
3.  **Install dependencies**
    ```sh
    flutter pub get
    ```
4.  **Generate required files**
    The project uses `injectable` for dependency injection, which requires code generation.
    ```sh
    dart run build_runner build --delete-conflicting-outputs
    ```
5.  **Run the application**
    ```sh
    flutter run
    ```

## Web Deployment

The web version of this application is configured for deployment on Vercel. The `vercel.json` file in the root directory contains the build commands and rewrite rules for proxying API requests to the backend server, enabling seamless communication between the frontend and backend in a production environment.
