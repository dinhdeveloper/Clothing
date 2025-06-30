import 'package:clothing/core/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Navigation
  locator.registerSingleton<NavigationService>(NavigationService());

  // Repositories
  // locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // API Clients
  // locator.registerLazySingleton(() => DioClient(locator()));

  // ViewModels
  // locator.registerFactory(() => HomeViewModel(locator()));
}