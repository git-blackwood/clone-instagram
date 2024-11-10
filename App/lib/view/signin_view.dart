import 'package:clone_instagram_app/constant.dart';
import 'package:clone_instagram_app/view_model/signin_view_model.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthViewModel _viewModel = AuthViewModel();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PADDING_20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Instagram"),
            const SizedBox(height: GAP_20),
            TextField(
              controller: _viewModel.usernameTextController,
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: GAP_20),
            TextField(
              controller: _viewModel.passwordTextController,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: GAP_20),
            ElevatedButton(
              onPressed: () => _viewModel.signIn(context: context),
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}