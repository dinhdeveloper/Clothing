import 'package:clothing/core/navigation/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../di/locator.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showAppBar = true;
  bool get showAppBar => _showAppBar;

  bool _showBottomNav = true;
  bool get showBottomNav => _showBottomNav;

  int get currentIndex => 0;
  void onBottomNavTapped(int index) {}

  String _appBarTitle = "App";
  String get appBarTitle => _appBarTitle;

  void setAppBarTitle(String title) {
    _appBarTitle = title;
    notifyListeners();
  }

  final NavigationService navigationService = locator<NavigationService>();

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setAppBarVisibility(bool visible) {
    _showAppBar = visible;
    notifyListeners();
  }

  void setBottomNavVisibility(bool visible) {
    _showBottomNav = visible;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("Disposing $runtimeType");
  }
}