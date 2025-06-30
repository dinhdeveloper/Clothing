import 'app_config.dart';

class ProdConfig implements AppConfig {
  @override
  String get baseUrl => 'https://api.production.com';

  @override
  String get apiKey => 'PROD_API_KEY_123456';

  @override
  String get environmentName => 'Production';

  @override
  bool get enableDebug => false;
}