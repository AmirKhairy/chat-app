class UsersModel {
  String? password;
  String? email;
  String? id;
  String? name;

  UsersModel({
    this.password,
    this.email,
    this.id,
    this.name,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    password = json['password'] as String?;
    email = json['email'] as String?;
    id = json['id'] as String?;
    name = json['name'] as String?;
  }
}
