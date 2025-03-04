class UsersModel {
  String? password;
  String? email;
  String? id;

  UsersModel({this.password, this.email, this.id});

  UsersModel.fromJson(Map<String, dynamic> json) {
    password = json['password'] as String?;
    email = json['email'] as String?;
    id = json['id'] as String?;
  }
}
