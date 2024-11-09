import 'package:clone_instagram_app/view_model/signin_view_model.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthViewModel _viewModel = AuthViewModel();

    return Scaffold(
      body: Column(
        children: [
          Text("Instagram"),
          TextField(),
          TextField(),
          ElevatedButton(
            onPressed: () => _viewModel.signIn(),
            child: Text("SignIn"),
          ),
        ],
      ),
    );
  }
}