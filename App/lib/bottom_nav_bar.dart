import 'package:clone_instagram_app/view/home_view.dart';
import 'package:clone_instagram_app/view/add_post_view.dart';
import 'package:clone_instagram_app/view_model/add_post_view_model.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final AddPostViewModel _addPostViewModel = AddPostViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const HomeView(),
        const HomeView(),
        const AddPostView(),
        const HomeView(),
        const HomeView(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;

            debugPrint("BottomNavBar::build - onDestinationSelected index : $selectedIndex");

            if (selectedIndex == 2) {
              _addPostViewModel.pickImage();
            }
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: "home",
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "search",
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box_outlined),
            label: "add",
          ),
          NavigationDestination(
            icon: Icon(Icons.video_collection_outlined),
            label: "video",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "mypage",
          ),
        ],
      ),
    );
  }
}