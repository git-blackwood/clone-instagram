class UserModel {
  final int userId;
  final String username;

  UserModel({
    required this.userId,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["id"],
      username: json["username"],
    );
  }
}