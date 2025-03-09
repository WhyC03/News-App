# NewsWave

A New App for Reading News.

### Prerequisites
- [NewsAPI Key](https://newsapi.org/)

### Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/news_app.git
   cd news_app
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Add your NewsAPI Key:
   - Open the `news_controller.dart` file located in `lib/controllers/`.
   - Replace `YOUR_API_KEY` with your actual API key from NewsAPI Website.
     ```dart
     // filepath: d:\Flutter Projects\news_app\lib\controllers\news_controller.dart
     // ...existing code...
     final String apiKey = 'YOUR_API_KEY';
     // ...existing code...
     ```

### Running the App

1. Connect your device or start an emulator.
2. Run the app:
   ```sh
   flutter run
   ```

### Resources

NewsApi Website Link- (https://newsapi.org/)
