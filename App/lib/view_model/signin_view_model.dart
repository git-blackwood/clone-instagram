import 'package:clone_instagram_app/bottom_nav_bar.dart';
import 'package:clone_instagram_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel {
  final AuthRepository _repository = AuthRepository();

  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  signIn({required BuildContext context}) {
    _repository.signIn(
      username: usernameTextController.text,
      password: passwordTextController.text,
    ).then((isSignInSuccess) {
      if (isSignInSuccess) {
        Navigator.of(context).pop();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavBar()));
      } else {
        debugPrint("SignInViewModel::signIn - Fail to sign in");
      }
    });
  }
}