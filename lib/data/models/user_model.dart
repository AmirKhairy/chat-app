class UserModel {
  String? name;
  String? password;
  String? email;
  String? id;

  UserModel({
    this.password,
    this.email,
    this.id,
    this.name,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    password = json['password'] as String?;
    email = json['email'] as String?;
    id = json['id'] as String?;
    id = json['name'] as String?;
  }
}
