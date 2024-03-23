import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvManager {


  Future<void> loadEnvFile() async {
    await dotenv.load(fileName: ".env");
  }

  String baseUrl() {
    return dotenv.env['BASE_URL']!;
  }

  String apiKey() {
    return dotenv.env['API_KEY']!;
  }
}
