import 'package:clone_instagram_app/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthViewModel {
  final AuthRepository _repository = AuthRepository();

  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  signIn() {
    _repository.signIn(
      username: usernameTextController.text,
      password: passwordTextController.text,
    );
  }
}