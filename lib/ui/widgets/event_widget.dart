import 'package:evently/model/event_dm.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final EventDM eventDM;
  const EventWidget({super.key, required this.eventDM});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(8),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(eventDM.image)),
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
    child: Text(
      eventDM.date,
      style: TextStyle(
        color: AppColors.purple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

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
        ImageIcon(
          AssetImage(
            eventDM.isFavorite ? AppAssets.heartActive : AppAssets.heartIc,
          ),
        ),
      ],
    ),
  );
}
