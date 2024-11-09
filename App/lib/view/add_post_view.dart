import 'dart:io';

import 'package:clone_instagram_app/constant.dart';
import 'package:clone_instagram_app/view_model/add_post_view_model.dart';
import 'package:flutter/material.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {

  final AddPostViewModel _viewModel = AddPostViewModel();

  onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    _viewModel.addListener(onViewModelChanged);
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.removeListener(onViewModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              if (_viewModel.pickedImage?.path != null)
                Image.file(
                  File(_viewModel.pickedImage!.path),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
          
              TextField(
                controller: _viewModel.textController,
                focusNode: _viewModel.textFocusNode,
                onTapOutside: (event) => _viewModel.textFocusNode.unfocus(),
                decoration: const InputDecoration(
                  hintText: "Write a phrase or add a survey..",
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
      
          Positioned(
            bottom: GAP_20,
            left: GAP_20,
            right: GAP_20,
            child: ElevatedButton(
              onPressed: () => _viewModel.uploadPost(),
              child: const Text("Upload"),
            ),
          ),
        ],
      ),
    );
  }
}