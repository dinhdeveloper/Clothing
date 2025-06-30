import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator.dart';

class AppModule {
  static Future<void> init() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    locator.registerSingleton<SharedPreferences>(sharedPrefs);

    locator.registerSingleton<Dio>(Dio()
      ..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      )));
  }
}