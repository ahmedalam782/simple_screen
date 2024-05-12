class UserModel {
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.password,
  });
}

List<UserModel> userModel = [
  UserModel(email: "MohamedAli@gmail.com", password: "T123"),
  UserModel(email: "Lolk1596@gmail.com", password: "5863"),
  UserModel(email: "Karim@gmail.com", password: "PP88"),
  UserModel(email: "Amr44@gmail.com", password: "AMP998"),
];
