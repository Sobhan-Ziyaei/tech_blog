import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static const screenId = '/main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.menu),
                Assets.images.png.techLogoImg.image(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().setWidth(80),
                ),
                const Icon(Icons.search),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(170),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.png.homePosterImg.path),
                        fit: BoxFit.fill,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: homePosterCoverGradient,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              MainStrings.homePosterAuthor,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: whiteColor),
                            ),
                            Text(
                              MainStrings.homePosterLikes,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: whiteColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          MainStrings.homePosterTitle,
                          style: theme.textTheme.bodyLarge
                              ?.copyWith(color: whiteColor),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
