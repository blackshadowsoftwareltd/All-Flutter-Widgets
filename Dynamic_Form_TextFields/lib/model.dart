class UserModel {
  String? userName;
  int? age;
  List<String>? emails;

  UserModel({this.userName, this.age, this.emails});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['age'] = this.age;
    data['email'] = this.emails;
    return data;
  }
}
