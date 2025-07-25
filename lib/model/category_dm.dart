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
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Sport",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.cakeIc,
      title: "Birthday",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Meeting",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Gaming",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Eating",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Holiday",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Exhibition",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "WorkShop",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "BookClub",
      imageBg: AppAssets.logoHorizontal,
    ),
  ];
  static List<CategoryDM> createEventsCategories = [
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Sport",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.cakeIc,
      title: "Birthday",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Meeting",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Gaming",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Eating",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Holiday",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "Exhibition",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "WorkShop",
      imageBg: AppAssets.logoHorizontal,
    ),
    CategoryDM(
      image: AppAssets.bikeIc,
      title: "BookClub",
      imageBg: AppAssets.logoHorizontal,
    ),
  ];
}
