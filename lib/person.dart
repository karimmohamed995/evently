class Person {
  late String _name;

  set name(String name) {
    if (name.isEmpty) return;
    _name = name;
  }

  String get name => _name + "/";
}
