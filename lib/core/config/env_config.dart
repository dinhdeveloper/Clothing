import 'app_config.dart';

class Environment {
  static late AppConfig _config;

  static void init({required AppConfig config}) {
    _config = config;
  }

  static AppConfig get config => _config;
}