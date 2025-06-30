import 'app_config.dart';

class UatConfig implements AppConfig {
  @override
  String get baseUrl => 'https://api.uat.com';

  @override
  String get apiKey => 'UAT_API_KEY_123456';

  @override
  String get environmentName => 'UAT';

  @override
  bool get enableDebug => true;
}