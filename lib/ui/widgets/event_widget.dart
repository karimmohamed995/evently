import 'package:evently/model/category_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDM eventDM;
  const EventWidget({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    CategoryDM categoryDM = CategoryDM.fromTitle(eventDM.categoryId);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(8),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(categoryDM.imageBg)),
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [buildDate(), Spacer(), buildTitle()],
      ),
    );
  }

  buildDate() => Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),

    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Text(
          eventDM.date.day.toString(),
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          getMonthName(eventDM.date.month),
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );

  String getMonthName(int month) {
    const List<String> months = [
      "jan",
      "feb",
      "mar",
      "apr",
      "may",
      "jun",
      "jul",
      "aug",
      "sep",
      "oct",
      "nov",
      "dec",
    ];
    return months[month - 1];
  }

  buildTitle() => Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      children: [
        Text(
          eventDM.title,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        ImageIcon(AssetImage(true ? AppAssets.heartActive : AppAssets.heartIc)),
      ],
    ),
  );
}
