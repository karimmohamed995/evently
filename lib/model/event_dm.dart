// import 'dart:convert';

// import 'package:evently/model/category_dm.dart';
// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class EventDM {
  static const String collectionName = "events";
  late String id;
  late String title;
  late String categoryId;
  late DateTime date;
  // bool isFavorite;
  late String description;
  // TimeOfDay time;
  late double? lat;
  late double? lng;
  late String ownerId;

  EventDM({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.date,
    // required this.isFavorite,
    required this.description,
    // required this.time,
    required this.ownerId,
    this.lat,
    this.lng,
  });

  EventDM.fromJson(Map<String, dynamic> json) {
    print("JSON Data: $json");
    id = json["id"];
    title = json["title"];
    categoryId = json["categoryId"];
    var timeStamp = json["date"] as Timestamp;
    date = timeStamp.toDate();
    description = json["description"];
    ownerId = json["ownerId"];
    lat = json["lat"];
    lng = json["lng"];
  }
  // EventDM.fromJson(Map<String, dynamic> json) {
  //   print("JSON Data: $json");

  //   id = json["id"] ?? '';
  //   title = json["title"] ?? '';
  //   categoryId = json["category"] ?? '';
  //   var timeStamp = json["date"] as Timestamp?;
  //   date = timeStamp?.toDate() ?? DateTime.now();
  //   description = json["description"] ?? '';
  //   ownerId = json["ownerId"] ?? '';
  //   lat = (json["lat"] as num?)?.toDouble();
  //   lng = (json["lng"] as num?)?.toDouble();
  // }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "date": date,
      // "time": event.time,
      "categoryId": categoryId,
      "id": id,
      "ownerId": ownerId,
      "lat": lat,
      "lng": lng,
    };
  }
}
