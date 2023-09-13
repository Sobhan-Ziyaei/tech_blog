import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/screens/register_intro_screen.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.customTheme,
    required this.onPressed,
    required this.buttonText,
    required this.width,
    required this.heigh,
  });

  final ThemeData customTheme;
  final Function() onPressed;
  final String buttonText;
  final int width;
  final int heigh;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(
              ScreenUtil().setWidth(width), ScreenUtil().setHeight(heigh))),
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
                return customTheme.textTheme.bodyLarge;
              } else {
                return customTheme.textTheme.bodyMedium;
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
        child: Text(buttonText),
      ),
    );
  }
}
