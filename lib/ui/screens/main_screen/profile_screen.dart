import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/ui/components/app_divider.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Assets.images.png.profileAvatarImg.image(scale: 2.5),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.png.penImg.image(scale: 2.5),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Text(
                    ProfileScreenStrings.modifyProfileAvatar,
                    style:
                        theme.textTheme.bodyMedium?.copyWith(color: blueColor),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                ProfileScreenStrings.sampleUserName,
                style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
              ),
              const SizedBox(height: 5),
              Text(
                ProfileScreenStrings.sampleUserEmail,
                style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
              ),
              const SizedBox(height: 60),
              const AppDivider(),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Text(
                    ProfileScreenStrings.favoriteArticles,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const AppDivider(),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Text(
                    ProfileScreenStrings.favoriteCast,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const AppDivider(),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: () {},
                  splashColor: primaryColor,
                  child: Text(
                    ProfileScreenStrings.exitProfile,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: blackColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
