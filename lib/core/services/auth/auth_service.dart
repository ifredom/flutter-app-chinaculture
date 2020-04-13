import 'dart:async';

import 'package:chinaculture/core/model/userinfo/user.dart';

abstract class AuthService {
  User get currentUser;
  String get invitationCode;
  String get userType;
  Future<void> updateCurrentUser(User userinfo);

  Stream<User> get user; // 测试使用流控制数据
  Future signUpWithAuthcode(String mobile, String authCode);
  Future signUpWithAuthPassword(String mobile, String password);
  Future fetchUserInfo(String id);
  Future fetchResetPassword(String vcode, String pwd);
  Future fetchIsNewUser(String mobile, String openId);

  Future fetchUserBalance();

  Future<void> signOut();
  Future<bool> isUserLoggedIn();

  Future<void> updateUserNiceName(String name);
}
