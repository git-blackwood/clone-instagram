class UserManager {
  static final UserManager _instance = UserManager._();
  UserManager._();
  factory UserManager() {
    return _instance;
  }

  String? accessToken;
}