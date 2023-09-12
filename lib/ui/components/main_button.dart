import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/screens/main_screen/register_screen/register_intro_screen.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.customTheme,
  });

  final RegisterIntroScreen customTheme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll(
            Size(ScreenUtil().setWidth(100), ScreenUtil().setHeight(40))),
        maximumSize: MaterialStatePropertyAll(
            Size(ScreenUtil().setWidth(200), ScreenUtil().setHeight(80))),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return blueColor;
            } else {
              return primaryColor;
            }
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return customTheme.theme.textTheme.bodyLarge;
            } else {
              return customTheme.theme.textTheme.bodyMedium;
            }
          },
        ),
        shadowColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return blueColor;
            } else {
              return blackColor;
            }
          },
        ),
      ),
      child: const Text(RegisterScreenStrings.letsGo),
    );
  }
}