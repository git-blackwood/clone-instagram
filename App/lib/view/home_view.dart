import 'package:clone_instagram_app/constant.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PADDING_20),
        child: Column(
          children: [
            HomeAppBar(),
          ],
        ),
      ),
    );
  }

  Widget HomeAppBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Instagram"),
        Row(
          children: [
            Icon(Icons.favorite_border),
            SizedBox(width: GAP_20),
            Icon(Icons.message),
          ],
        ),
      ],
    );
  }
}