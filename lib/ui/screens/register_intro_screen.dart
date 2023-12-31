import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/ui/components/main_button.dart';
import 'package:tech_blog/ui/constants/strings.dart';
import 'package:tech_blog/ui/screens/my_category.dart';
import 'package:tech_blog/ui/theme/colors.dart';
import 'package:validators/validators.dart';

class RegisterIntroScreen extends StatefulWidget {
  RegisterIntroScreen({Key? key, required this.theme}) : super(key: key);
  final ThemeData theme;
  @override
  State<RegisterIntroScreen> createState() => _RegisterIntroScreenState();
}

class _RegisterIntroScreenState extends State<RegisterIntroScreen> {
  @override
  Widget build(BuildContext context) {
        ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.svg.registerImg.path,
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setWidth(100),
              ),
              SizedBox(height: ScreenUtil().setHeight(15)),
              RichText(
                text: TextSpan(
                    text: RegisterScreenStrings.welcome,
                    style: widget.theme.textTheme.bodyLarge),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              MainButton(
                customTheme: theme,
                onPressed: () {
                  showEmailModalSheet(context);
                },
                buttonText: RegisterScreenStrings.letsGo,
                heigh: 40,
                width: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showEmailModalSheet(BuildContext context) {
        ThemeData theme = Theme.of(context);

    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: ScreenUtil().setHeight(400),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(RegisterScreenStrings.insertEmail,
                      style: widget.theme.textTheme.bodyMedium),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30)),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      style: widget.theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: RegisterScreenStrings.sampleEmail,
                        hintStyle: widget.theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  MainButton(
                    customTheme: theme,
                    onPressed: () {
                      Navigator.pop(context);
                      showPhoneCodeModalSheet(context);
                    },
                    buttonText: RegisterScreenStrings.continueText,
                    width: 200,
                    heigh: 50,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showPhoneCodeModalSheet(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: ScreenUtil().setHeight(400),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(RegisterScreenStrings.insertPhoneCode,
                      style: widget.theme.textTheme.bodyMedium),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(30)),
                    child: TextField(
                      onChanged: (value) {
                        print(isEmail(value));
                      },
                      style: widget.theme.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '******',
                        hintStyle: widget.theme.textTheme.bodyMedium
                            ?.copyWith(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  MainButton(
                    customTheme: theme,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyCategory.screenId);
                    },
                    buttonText: RegisterScreenStrings.continueText,
                    width: 200,
                    heigh: 50,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
