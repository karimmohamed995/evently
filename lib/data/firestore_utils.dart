import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event_dm.dart';
import 'package:evently/model/user_dm.dart';
// import 'package:firebase_auth/firebase_auth.dart';

Future<void> addUserToFirestore(UserDM user) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );

  // create new id for user
  //userCollection.add({})
  //create empty doc with given id
  var emptyDoc = userCollection.doc(user.id);
  // return emptyDoc.set({"id": user.id, "name": user.name, "email": user.email});

  emptyDoc.set(user.toJson());
}

Future<UserDM> getFromUserFirestore(String userId) async {
  CollectionReference userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );

  DocumentReference userDoc = userCollection.doc(userId);
  DocumentSnapshot snapshot = await userDoc.get();
  Map json = snapshot.data() as Map;
  // var user = UserDM(id: json["id"], name: json["name"], email: json["email"]);
  var user = UserDM.fromJson(json);
  return user;
}

Future<void> addEventToFirestore(EventDM event) async {
  //create new collection
  var eventsCollection = FirebaseFirestore.instance.collection(
    EventDM.collectionName,
  );

  // eventsCollection.add({
  //   "title": event.title,
  //   "description": event.description,
  //   "date": event.date,
  //   // "time": event.time,
  //   "category": event.categoryId,
  //   "id": "",
  //   "ownerId": "",
  // });

  //create empty doc with auto generated id
  var emptyDoc = eventsCollection.doc();
  event.id = emptyDoc.id;
  // emptyDoc.set({
  //   "title": event.title,
  //   "description": event.description,
  //   "date": event.date,
  //   // "time": event.time,
  //   "category": event.categoryId,
  //   "id": emptyDoc.id,
  //   "ownerId": "",
  // });
  emptyDoc.set(event.toJson());
}

Future<List<EventDM>> getAllEventsFromFirestore() async {
  var eventsCollection = FirebaseFirestore.instance.collection(
    EventDM.collectionName,
  );
  var querySnapshot = await eventsCollection.get();
  List<EventDM> events = querySnapshot.docs.map((docSnapshot) {
    var json = docSnapshot.data();
    return EventDM.fromJson(json);
  }).toList();

  return events;
}

Future<List<EventDM>> getFavoriteEvents() async {
  var eventsCollection = FirebaseFirestore.instance.collection(
    EventDM.collectionName,
  );
  var querySnapshot = await eventsCollection
      .where("id", whereIn: UserDM.currentUser!.favoriteEvents)
      .get();
  List<EventDM> events = querySnapshot.docs.map((docSnapshot) {
    var json = docSnapshot.data();
    return EventDM.fromJson(json);
  }).toList();

  return events;
}

Future addEventToFavorite(String eventId) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );
  var currentUserDoc = userCollection.doc(UserDM.currentUser!.id);

  // var eventsList = UserDM.currentUser!.favoriteEvents;
  // eventsList.add(eventId);

  currentUserDoc.update({
    "favoriteEvents": FieldValue.arrayUnion([eventId]),
  });
  UserDM.currentUser!.favoriteEvents.add(eventId);
}

Future removeEventToFavorite(String eventId) async {
  var userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );
  var currentUserDoc = userCollection.doc(UserDM.currentUser!.id);

  // var eventsList = UserDM.currentUser!.favoriteEvents;
  // eventsList.add(eventId);

  currentUserDoc.update({
    "favoriteEvents": FieldValue.arrayRemove([eventId]),
  });
  UserDM.currentUser!.favoriteEvents.remove(eventId);
}


// List<EventDM> getFavoriteEventsFromFirestore(){}