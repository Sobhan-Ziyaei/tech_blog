import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/screens/main_screen/main_screen.dart';
import 'package:tech_blog/ui/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const screenId = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToMainScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.images.png.techLogoImg.image(
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(100),
              ),
              SpinKitRotatingCircle(
                color: blackColor,
                size: ScreenUtil().setWidth(20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateToMainScreen() async {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamed(context, MainScreen.screenId);
    });
  }
}
