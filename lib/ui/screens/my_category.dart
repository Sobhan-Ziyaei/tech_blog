import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class MyCategory extends StatefulWidget {
  MyCategory({Key? key}) : super(key: key);
  static const screenId = '/my_category';

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(30)),
              SvgPicture.asset(
                Assets.images.svg.registerImg.path,
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setWidth(100),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Text(
                MyCategoryScreenStrings.welcomeCategoryScreen,
                style:
                    theme.textTheme.bodyMedium?.copyWith(color: primaryColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
                child: TextField(
                  decoration: InputDecoration(
                    // hintText: 
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
