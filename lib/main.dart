import 'package:flutter/material.dart';
import 'core/config/env_config.dart';
import 'core/config/env_prod.dart';
import 'core/config/env_uat.dart';
import 'app.dart';
import 'core/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo DI trước
  await setupLocator();

  // Thiết lập môi trường
  //_setupEnvironment();

  runApp(const MyApp());
}

void _setupEnvironment() {
  const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: 'uat',
  );

  const flavor = String.fromEnvironment(
    'FLAVOR',
    defaultValue: 'dev',
  );

  debugPrint('Running with flavor: $flavor in $environment environment');

  if (environment == 'prod') {
    Environment.init(config: ProdConfig());
  } else {
    Environment.init(config: UatConfig());
  }
}