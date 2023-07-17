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
}
