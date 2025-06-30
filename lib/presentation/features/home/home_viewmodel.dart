
import 'package:clothing/core/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  // final UserRepository _userRepo = locator<UserRepository>();

  setAppBarVisibility(bool visible);


  Future<void> loadData() async {
    setLoading(true);
    try {
      // final data = await _userRepo.getUserData();
      // Handle data
    } catch (e) {
      // navigationService.showErrorDialog(e.toString());
    } finally {
      setLoading(false);
    }
  }

  @override
  int get currentIndex => 0;

  @override
  void onBottomNavTapped(int index) {
    // TODO: Handle tab switch
  }
}
