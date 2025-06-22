import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {

  static String theCatApiKey = dotenv.env['THE_CAT_API_KEY'] ?? '';

}