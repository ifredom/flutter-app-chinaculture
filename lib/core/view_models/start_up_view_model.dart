import 'package:chinaculture/core/model/userinfo/user.dart';
import 'package:chinaculture/core/routes/routers.dart';
import 'package:chinaculture/core/services/auth/auth_service.dart';
import 'package:chinaculture/core/utils/res/local_storage.dart';
import 'package:chinaculture/core/utils/res/local_storage_keys.dart';
import 'package:chinaculture/locator.dart';
import 'package:chinaculture/core/services/navigation/navigation_service.dart';
import 'base_view_model.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
      var res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.userType == "T") {
          _navigationService.pushReplacementNamed(RoutesUtils.teacherHomePage);
        } else {
          _navigationService.pushReplacementNamed(RoutesUtils.homePage);
        }
      }
    } else {
      _navigationService.pushReplacementNamed(RoutesUtils.loginPage);
    }
  }
}
