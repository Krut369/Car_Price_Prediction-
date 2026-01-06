# Car Price App

A modern Flutter application designed to predict car prices based on user-provided details. This app leverages a backend API to provide accurate price estimations in real-time.

## 🚀 Features

- **Price Prediction**: Enter vehicle specifications to get an instant price estimate.
- **User-Friendly Interface**: Clean and intuitive UI built with Material Design.
- **Real-Time Data**: Communicates with a dedicated backend service for predictions.
- **State Management**: Efficient state handling using the `provider` package.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Networking**: [http](https://pub.dev/packages/http)
- **Icons**: Cupertino Icons & Material Icons

## 🏁 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `^3.5.4` or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/Krut369/Car_Price_Prediction-.git
    cd car_price_app
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the application**:
    ```bash
    flutter run
    ```

## 📂 Folder Structure

The project structure is organized as follows:

```
lib/
├── models/       # Data models for API responses and app state
├── screens/      # UI screens (e.g., HomeScreen)
├── services/     # API services for network requests
├── theme/        # Application theming and styling
├── widgets/      # Reusable UI components
└── main.dart     # Application entry point
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
