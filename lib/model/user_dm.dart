class UserDM {
  static const String collectionName = "users";
  static UserDM? currentUser;
  late String id;
  late String name;
  late String email;
  late List<String> favoriteEvents;
  // String password;

  UserDM({
    required this.id,
    required this.name,
    required this.email,
    required this.favoriteEvents,
  });

  UserDM.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    // favoriteEvents = json["favoriteEvents"] ?? [];
    List<dynamic> favList = json["favoriteEvents"] ?? [];
    favoriteEvents = favList.map((id) => id.toString()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "favoriteEvents": favoriteEvents,
    };
  }
}
