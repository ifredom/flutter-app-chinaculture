import 'package:chinaculture/core/utils/res/resources.dart';
import 'package:chinaculture/core/utils/res/ui_helper.dart';
import 'package:chinaculture/core/view_models/login_view_model.dart';
import 'package:chinaculture/ui/widgets/buttons/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/core/utils/common/ScreenUtil.dart';
import 'package:chinaculture/core/utils/common/color_utils.dart';
import 'package:chinaculture/core/utils/res/gaps.dart';
import 'package:chinaculture/ui/widgets/textfield/text_field.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Form(
              key: formKey,
              child: IgnorePointer(
                ignoring: model.busy,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Gaps.vGap50,
                      BuildLogo(),
                      InputField(
                        focusNode: _phoneFocus,
                        autofocus: false,
                        hintText: "手机号码",
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        borderColor: HexToColor("#CBAEFA"),
                      ),
                      Gaps.vGap20,
                      InputField(
                        focusNode: _pwdFocus,
                        autofocus: false,
                        obscureText: true,
                        hintText: "密码",
                        controller: pwdController,
                        borderColor: HexToColor("#CBAEFA"),
                      ),
                      Gaps.vGap40,
                      BuildLoginButton(
                        busy: model.busy,
                        onPressed: () {
                          if (!formKey.currentState.validate()) return;
                          model.loginWithPassword(
                            phoneController.text,
                            pwdController.text,
                          );
                        },
                      ),
                      Gaps.vGap40,
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                "注册",
                                style: TextStyle(
                                  color: HexToColor("#5324B3"),
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {},
                            ),
                            GestureDetector(
                              child: Text(
                                "验证码登录",
                                style: TextStyle(
                                  color: HexToColor("#5324B3"),
                                  fontSize: 14,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildLogo extends StatelessWidget {
  final Function onPressed;
  const BuildLogo({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            'assets/ifredom.jpg',
            fit: BoxFit.contain,
            width: 80,
          ),
        ),
        Gaps.vGap30,
        Text(
          "轻 · 音",
          style: TextStyle(fontSize: 22),
        ),
        Gaps.vGap15,
        SizedBox(
          height: 1,
          width: 40,
          child: DecoratedBox(
              decoration: BoxDecoration(color: HexToColor("#88ada6"))),
        ),
        Gaps.vGap8,
        Text(
          "每个人都是声音的艺术家",
          style: TextStyle(fontSize: 12, letterSpacing: 4),
        ),
        Gaps.vGap8,
        SizedBox(
          height: 1,
          width: 40,
          child: DecoratedBox(
              decoration: BoxDecoration(color: HexToColor("#88ada6"))),
        ),
        Gaps.vGap40,
      ],
    );
  }
}

class BuildLoginButton extends StatelessWidget {
  final bool busy;
  final Function onPressed;
  const BuildLoginButton({
    Key key,
    this.busy,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GradientButton(
        loading: busy,
        text: '登录',
        onPressed: onPressed,
      ),
    );
  }
}
