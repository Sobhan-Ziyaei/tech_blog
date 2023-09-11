import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
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
                        image: AssetImage(mainScreenPosterMap['imageAssets']),
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
                              mainScreenPosterMap['writer'],
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(color: whiteColor),
                            ),
                            Row(
                              children: [
                                Text(
                                  mainScreenPosterMap['views'],
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(color: whiteColor),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: whiteColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          mainScreenPosterMap['title'],
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
            const SizedBox(height: 20),
            SizedBox(
              height: ScreenUtil().setHeight(35),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == 0
                          ? ScreenUtil().setWidth(30)
                          : ScreenUtil().setWidth(15),
                    ),
                    child: HashTagItem(text: tagList[index].title),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              child: Row(
                children: [
                  Assets.images.png.penImg.image(scale: 2),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Text(
                    MainStrings.hotArticles,
                    style:
                        theme.textTheme.bodyLarge?.copyWith(color: blueColor),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: ScreenUtil().setHeight(200),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogList.getRange(0, 5).length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: index == 0
                              ? ScreenUtil().setWidth(30)
                              : ScreenUtil().setWidth(15),
                        ),
                        child: SizedBox(
                          width: ScreenUtil().setWidth(150),
                          height: ScreenUtil().setHeight(150),
                          child: Stack(
                            children: [
                              PostItem(
                                path: blogList[index].imageUrl,
                              ),
                              Positioned(
                                bottom: 5,
                                right: 0,
                                left: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(color: whiteColor),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          mainScreenPosterMap['views'],
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(color: whiteColor),
                                        ),
                                        const SizedBox(width: 5),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: whiteColor,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(
                          right: index == 0
                              ? ScreenUtil().setWidth(30)
                              : ScreenUtil().setWidth(15),
                        ),
                        child: SizedBox(
                          width: ScreenUtil().setWidth(150),
                          child: Text(
                            blogList[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
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

class PostItem extends StatelessWidget {
  PostItem({Key? key, required this.path}) : super(key: key);
  String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(path),
          fit: BoxFit.cover,
        ),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: blogPost,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
