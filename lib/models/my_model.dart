class MyModel {
  String? avatar;
  String? firstName;
  String? lastName;
  String? email;
  MyModel(
      {required this.avatar,
      required this.firstName,
      required this.lastName,
      required this.email});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      avatar: json['avatar'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
    );
  }
}
