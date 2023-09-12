import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/ui/components/main_button.dart';
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(50)),
                  child: TextField(
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: MyCategoryScreenStrings.name,
                      hintStyle: theme.textTheme.bodyMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(30)),
                Text(
                  MyCategoryScreenStrings.selectedYouCategory,
                  style:
                      theme.textTheme.bodyMedium?.copyWith(color: primaryColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: ScreenUtil().setHeight(20)),
                SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(100),
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: tagList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedTags.add(tagList[index]);
                            });
                          },
                          child: HashTagItem(text: tagList[index].title),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                SvgPicture.asset(Assets.images.svg.arrowDownImg.path,
                    height: ScreenUtil().setHeight(50)),
                SizedBox(height: ScreenUtil().setHeight(15)),
                SizedBox(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(100),
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: selectedTags.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 0.3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(15),
                        ),
                        child: SelectedHashTagItem(
                            onPressed: () {
                              setState(() {
                                selectedTags.removeAt(index);
                              });
                            },
                            text: selectedTags[index].title),
                      );
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HashTagItem extends StatelessWidget {
  HashTagItem({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: ScreenUtil().setWidth(90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          '# $text',
          style: theme.textTheme.bodySmall?.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}

class SelectedHashTagItem extends StatelessWidget {
  SelectedHashTagItem({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: ScreenUtil().setWidth(90),
      decoration: const BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(color: blackColor),
            ),
            IconButton(
                onPressed: onPressed, icon: const Icon(CupertinoIcons.delete))
          ],
        ),
      ),
    );
  }
}
