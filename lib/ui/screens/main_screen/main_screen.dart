import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/screens/main_screen/home_screen.dart';
import 'package:tech_blog/ui/screens/main_screen/profile_screen.dart';
import 'package:tech_blog/ui/screens/register_intro_screen.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  static const screenId = '/main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  int selectedPageScreen = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: key,
      drawer: Drawer(
        backgroundColor: whiteColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
          child: ListView(
            children: [
              DrawerHeader(
                child: Assets.images.png.techLogoImg.image(scale: 3),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              ListTile(
                title: Text(
                  MyCategoryScreenStrings.profile,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const Divider(
                color: blackColor,
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              ListTile(
                title: Text(
                  MyCategoryScreenStrings.aboutTechBlog,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const Divider(
                color: blackColor,
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              ListTile(
                title: Text(
                  MyCategoryScreenStrings.shareTechBlog,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const Divider(
                color: blackColor,
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              ListTile(
                title: Text(
                  MyCategoryScreenStrings.githubTechBlog,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const Divider(
                color: blackColor,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  key.currentState?.openDrawer();
                },
                child: const Icon(Icons.menu, color: blackColor)),
            Assets.images.png.techLogoImg.image(
              height: ScreenUtil().setHeight(40),
              width: ScreenUtil().setWidth(80),
            ),
            const Icon(Icons.search, color: blackColor),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageScreen,
                children: mainScreenPage(theme),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: ScreenUtil().setHeight(80),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: bottomNavBackground,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(40),
                    vertical: ScreenUtil().setHeight(10),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      gradient: LinearGradient(colors: bottomNav),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectedPageScreen = 0;
                              });
                            },
                            icon: Assets.images.png.homeImg.image(scale: 2.5)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectedPageScreen = 1;
                              });
                            },
                            icon: Assets.images.png.wirteImg.image(scale: 2.5)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                selectedPageScreen = 2;
                              });
                            },
                            icon:
                                Assets.images.png.profileImg.image(scale: 2.5)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> mainScreenPage(ThemeData theme) {
    return [
      HomeScreen(theme: theme),
      RegisterIntroScreen(theme: theme),
      ProfileScreen(theme: theme),
    ];
  }
}
