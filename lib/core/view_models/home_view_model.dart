import 'package:oktoast/oktoast.dart';
import 'package:chinaculture/core/enums/view_state.dart';
import 'package:chinaculture/core/mixins/validators.dart';
import 'package:chinaculture/core/exceptions/repository_exception.dart';
import 'package:chinaculture/core/model/userinfo/user.dart';
import 'package:chinaculture/core/routes/routers.dart';
import 'package:chinaculture/core/services/auth/auth_service.dart';
import 'package:chinaculture/locator.dart';
import 'package:chinaculture/core/services/navigation/navigation_service.dart';
import 'package:chinaculture/core/utils/res/local_storage.dart';
import 'package:chinaculture/core/utils/res/local_storage_keys.dart';
import 'base_view_model.dart';

// ViewModelProvider应该使用得是 HomeViewModel中得数据
class HomeViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;

  int _musicStone = 0; // 乐石
  int get musicStone => _musicStone;
  int _musicNote = 0; // 乐符
  int get musicNote => _musicNote;

  bool get busy => state == ViewState.Busy;

  // 查询用户信息
  Future<void> initialise() async {
    setState(ViewState.Busy);
    String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
    bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      try {
        var res = await _authService.fetchUserInfo(id);
        setState(ViewState.DataFetched);
        if (res.data["code"] == 0) {
          User userinfo = User.fromMap(res.data["data"]);
          _authService.updateCurrentUser(userinfo);
          getUserBalance();
        } else {
          showToast(res.data["msg"]);
        }
      } on RepositoryException {
        setState(ViewState.Error);
      }
    } else {
      _navigationService.pushReplacementNamed(RoutesUtils.loginPage);
    }
  }

  Future<void> getUserBalance() async {
    var res = await _authService.fetchUserBalance();

    if (res.data["code"] == 0) {
      Map response = res.data["data"];
      _musicStone = response["musicStone"];
      _musicNote = response["musicNote"];
    } else {
      showToast(res.data["msg"]);
    }
  }
}
