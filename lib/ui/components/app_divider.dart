import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.25,
      color: dividerColor,
      indent: ScreenUtil().setWidth(70),
      endIndent: ScreenUtil().setWidth(70),
    );
  }
}