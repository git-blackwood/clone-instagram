import 'package:clone_instagram_app/constant.dart';
import 'package:clone_instagram_app/view/signin_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: COLOR_WHITE,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: COLOR_WHITE,
        ),
      ),
      home: const SigninView(),
    );
  }
}
