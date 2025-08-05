import 'package:evently/data/firestore_utils.dart';
import 'package:evently/model/category_dm.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
import 'package:evently/ui/utilities/app_assets.dart';
import 'package:evently/ui/utilities/app_colors.dart';
import 'package:evently/ui/utilities/dialog_utils.dart';
import 'package:evently/ui/widgets/category_tabs.dart';
import 'package:evently/ui/widgets/custom_button.dart';
import 'package:evently/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:evently/l10n/app_localizations.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  late AppLocalizations l10n;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  CategoryDM selectedCategory = CategoryDM.createEventsCategories[0];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  // TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            /// de 3shan kol el msafat el bnhom sabta gher kda ahot sized box mben kol haga wel tanya
            spacing: 16,

            children: [
              buildCategoryImage(),
              buildCategoryTabs(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Title",
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              //     ),
              //   ],
              // ),
              buildTitleTextField(),
              buildDescriptionTextField(),
              buildEventDate(),
              buildEventTime(),
              buildEventLocation(),
              // Spacer(),
              buildAddEventButton(),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() => AppBar(title: Text("Create Event"));

  buildCategoryImage() => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Image.asset(
      selectedCategory.imageBg,

      height: MediaQuery.of(context).size.height * 0.25,
    ),
  );

  buildCategoryTabs() => CategoryTabs(
    categories: CategoryDM.createEventsCategories,
    onTabSelected: (category) {
      selectedCategory = category;
      setState(() {});
    },
    selectedTabBg: AppColors.purple,
    selectedTabTextColor: AppColors.white,
    unselectedTabBg: AppColors.white,
    unselectedTabTextColor: AppColors.purple,
  );

  buildTitleTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Title",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      SizedBox(height: 8),
      CustomTextField(
        // hint: l10n.passwordHint,
        hint: "Event Title",
        prefixIcon: AppAssets.noteIc,
        controller: titleController,
      ),
    ],
  );

  buildDescriptionTextField() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        "Description",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      SizedBox(height: 8),
      CustomTextField(
        // hint: l10n.passwordHint,
        hint: "Description",
        minLines: 5,
        controller: descriptionController,
      ),
    ],
  );

  buildEventDate() => InkWell(
    onTap: () async {
      selectedDate =
          (await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: selectedDate,
            lastDate: DateTime.now().add(Duration(days: 365)),
          )) ??
          selectedDate;
    },
    child: Row(
      children: [
        Icon(Icons.calendar_month),
        SizedBox(width: 8),
        Text(
          "Event Date",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        Spacer(),
        Text(
          "Choose Date",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.purple,
          ),
        ),
      ],
    ),
  );

  buildEventTime() => InkWell(
    onTap: () async {
      selectedTime =
          (await showTimePicker(context: context, initialTime: selectedTime)) ??
          selectedTime;
    },
    child: Row(
      children: [
        Icon(Icons.access_time),
        SizedBox(width: 8),
        Text(
          "Event Time",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        Spacer(),
        Text(
          "Choose Time",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.purple,
          ),
        ),
      ],
    ),
  );

  buildEventLocation() => Container();

  buildAddEventButton() => CustomButton(
    text: "Add Event",
    onClick: () async {
      showLoading(context);
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
      EventDM eventDM = EventDM(
        id: "",
        title: titleController.text,
        categoryId: selectedCategory.title,
        date: selectedDate,
        description: descriptionController.text,
        // time: selectedTime,
        ownerId: UserDM.currentUser!.id,
      );
      await addEventToFirestore(eventDM);
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}
