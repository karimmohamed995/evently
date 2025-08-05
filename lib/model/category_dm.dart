import 'package:evently/ui/utilities/app_assets.dart';

class CategoryDM {
  String image;
  String title;
  String imageBg;

  CategoryDM({required this.image, required this.title, required this.imageBg});

  static List<CategoryDM> homeCategories = [
    CategoryDM(
      image: AppAssets.compassIc,
      title: "All",
      imageBg: AppAssets.sports,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Sport",
      imageBg: AppAssets.sports,
    ),
    CategoryDM(
      image: AppAssets.cakeIc,
      title: "Birthday",
      imageBg: AppAssets.birthday,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Meeting",
      imageBg: AppAssets.meeting,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Gaming",
      imageBg: AppAssets.gaming,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Eating",
      imageBg: AppAssets.eating,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Holiday",
      imageBg: AppAssets.holiday,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Exhibition",
      imageBg: AppAssets.exhibition,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "WorkShop",
      imageBg: AppAssets.workShop,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "BookClub",
      imageBg: AppAssets.bookClub,
    ),
  ];
  static List<CategoryDM> createEventsCategories = [
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Sport",
      imageBg: AppAssets.sports,
    ),
    CategoryDM(
      image: AppAssets.cakeIc,
      title: "Birthday",
      imageBg: AppAssets.birthday,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Meeting",
      imageBg: AppAssets.meeting,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Gaming",
      imageBg: AppAssets.gaming,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Eating",
      imageBg: AppAssets.eating,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Holiday",
      imageBg: AppAssets.holiday,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Exhibition",
      imageBg: AppAssets.exhibition,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "WorkShop",
      imageBg: AppAssets.workShop,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "BookClub",
      imageBg: AppAssets.bookClub,
    ),
  ];

  static CategoryDM fromTitle(String title) {
    return homeCategories.firstWhere((category) {
      return title == category.title;
    });
  }
}
