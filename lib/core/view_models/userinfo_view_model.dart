import 'package:oktoast/oktoast.dart';
import 'package:chinaculture/core/enums/view_state.dart';
import 'package:chinaculture/core/mixins/validators.dart';
import 'package:chinaculture/core/exceptions/repository_exception.dart';
import 'package:chinaculture/core/model/userinfo/user.dart';
import 'package:chinaculture/core/routes/routers.dart';
import 'package:chinaculture/core/services/auth/auth_service.dart';
import 'package:chinaculture/core/services/dialog/dialog_service.dart';
import 'package:chinaculture/locator.dart';
import 'package:chinaculture/core/services/navigation/navigation_service.dart';
import 'package:chinaculture/core/utils/res/local_storage.dart';
import 'package:chinaculture/core/utils/res/local_storage_keys.dart';
import 'base_view_model.dart';

// ViewModelProvider应该使用得是 UserinfoViewModel中得数据
class UserinfoViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  /// 必须实例化用户
  User _user;
  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户

  String get nickName => user.nickName;
  int get gender => user.gender;
  String get firstTeachingDate => user.firstTeachingDate;
  String get detailAddress => user.detailAddress;
  String get description => user.description;

  bool get isNewUser => _isNewUser;

  bool get busy => state == ViewState.Busy;

  // 查询用户信息
  Future<void> initialise(String id) async {
    setState(ViewState.Busy);
    final hasLoggedInUser = await _authService.isUserLoggedIn();
    if (hasLoggedInUser) {
      try {
        var res = await _authService.fetchUserInfo(id);
        setState(ViewState.DataFetched);
        if (res.data["code"] == 0) {
          User userinfo = User.fromMap(res.data["data"]);
          _authService.updateCurrentUser(userinfo);
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

  // 设置用户密码
  Future<dynamic> resetPassword(String vCode, String pwd) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.fetchResetPassword(vCode, pwd);
      setState(ViewState.DataFetched);
      return res;
    } on RepositoryException {
      setState(ViewState.Error);
    }
  }

  updateCurrentUser(User userInfo) {
    LocalStorage.set(LocalStorageKeys.TOKEN_KEY, userInfo.token);
    LocalStorage.set(LocalStorageKeys.HAS_LOGIN, true);

    _authService.updateCurrentUser(userInfo);
    notifyListeners();
  }

  updateIsNewUser(bool isNew) {
    _isNewUser = isNew;
    notifyListeners();
  }

  setNickname(String nickName) {
    _authService.updateUserNiceName(nickName);
    notifyListeners();
  }
}
