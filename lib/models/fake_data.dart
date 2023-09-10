import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/hashtag.dart';
import 'package:tech_blog/ui/constants/strings.dart';

Map mainScreenPosterMap = {
  'imageAssets': Assets.images.png.homePosterImg.path,
  'writer': MainStrings.homePosterAuthor,
  'views': MainStrings.homePosterViews,
  'title': MainStrings.homePosterTitle,
};

//blog fake data

List<HashTag> tagList = [
  HashTag(title: 'جاوا'),
  HashTag(title: 'کاتلین'),
  HashTag(title: 'وب'),
  HashTag(title: 'هوش مصنوعی'),
  HashTag(title: 'دارت'),
];
