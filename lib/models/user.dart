class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.birthDay,
    required this.email,
    this.verificationCode,
  });

  final String firstName;
  final String lastName;
  final String birthDay;
  final String email;
  String? verificationCode;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birthDay: json['birthDay'],
      firstName: json['firstName'],
      email: json['email'],
      lastName: json['lastName'],
      verificationCode: json['verificationCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['birthDay'] = birthDay;
    data['email'] = email;
    data['verificationCode'] = verificationCode;
    return data;
  }
}
