class User {
  int id;
  String name;
  String contact;
  String email;
  String password;

  User(
      {required this.id,
      required this.name,
      required this.contact,
      required this.email,
      required this.password});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        contact = json['contact'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact": contact,
        "email": email,
        "password": password
      };
}
