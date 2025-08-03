import 'package:evently/model/category_dm.dart';
import 'package:flutter/material.dart';

class EventDM {
  String id;
  String title;
  String categoryId;
  DateTime date;
  // bool isFavorite;
  String description;
  TimeOfDay time;
  double? lat;
  double? lng;

  EventDM({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.date,
    // required this.isFavorite,
    required this.description,
    required this.time,
    this.lat,
    this.lng,
  });
}
