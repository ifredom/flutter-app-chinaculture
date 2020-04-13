import 'package:chinaculture/core/utils/common/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/core/utils/res/resources.dart';

//自定义按钮
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.style,
    this.loading = false,
    this.prefixIcon,
    this.onPressed,
    this.borderRadius,
    @required this.text,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;
  final bool loading;

  final String text;
  final TextStyle style;
  final Widget prefixIcon;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<Color> _colors = this.colors ?? List();

    Color _backgroundColors; // 单色
    LinearGradient _linearGradient; // 渐变色

    if (_colors.length == 0) {
      _backgroundColors = theme.buttonColor;
      _linearGradient = null;
    } else if (_colors.length == 1) {
      _backgroundColors = _colors[0];
      _linearGradient = null;
    } else {
      _backgroundColors = null;
      _linearGradient = LinearGradient(colors: _colors);
    }

    return Container(
        width: this.width ?? 110,
        height: this.height ?? 32,
        decoration: BoxDecoration(
          color: _backgroundColors,
          gradient: _linearGradient,
          borderRadius: borderRadius ?? BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment(-0.7, 0),
              child: null == this.prefixIcon ? Gaps.empty : this.prefixIcon,
            ),
            Align(
              alignment: Alignment(-0.7, 0),
              child: loading
                  ? SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        backgroundColor: HexToColor("#4B5CC6"),
                      ),
                    )
                  : Gaps.empty,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: style ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}
