import 'package:oktoast/oktoast.dart';
import 'package:chinaculture/core/enums/view_state.dart';
import 'package:chinaculture/core/mixins/validators.dart';
import 'package:chinaculture/core/model/userinfo/user.dart';
import 'package:chinaculture/core/routes/routers.dart';
import 'package:chinaculture/core/services/auth/auth_service.dart';
import 'package:chinaculture/locator.dart';
import 'package:chinaculture/core/services/navigation/navigation_service.dart';
import 'package:chinaculture/core/exceptions/auth_exception.dart';
import 'package:chinaculture/core/utils/res/local_storage.dart';
import 'package:chinaculture/core/utils/res/local_storage_keys.dart';
import 'base_view_model.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
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

  /// 密码登录
  Future<void> loginWithPassword(String mobile, String password) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.signUpWithAuthPassword(mobile, password);
      _navigationService.pushReplacementNamed(RoutesUtils.homePage);
      setState(ViewState.DataFetched);
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  /// 验证码登录
  Future<void> loginWithVcode(String mobile, String authCode) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.signUpWithAuthcode(mobile, authCode);
      setState(ViewState.DataFetched);
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  /// 是否新用户
  Future queryIsNewUser(String mobile, String id) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.fetchIsNewUser(mobile, id);
      setState(ViewState.DataFetched);
      if (res.data["code"] == 0) {
        return res.data["data"] != "";
      } else {
        setState(ViewState.NoDataAvailable);
        showToast(res.data["msg"]);
      }
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  updateIsNewUser(bool isNew) {
    _isNewUser = isNew;
    notifyListeners();
  }
}
