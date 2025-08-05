class UserDM {
  static const String collectionName = "users";
  static UserDM? currentUser;
  late String id;
  late String name;
  late String email;
  // String password;

  UserDM({required this.id, required this.name, required this.email});

  UserDM.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email};
  }
}
