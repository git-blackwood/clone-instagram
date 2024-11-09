import 'package:clone_instagram_app/repository/post_repository.dart';
import 'package:clone_instagram_app/util/picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostViewModel extends ChangeNotifier {
  static final AddPostViewModel _instace = AddPostViewModel._();
  AddPostViewModel._();
  factory AddPostViewModel() {
    return _instace;
  }

  final PostRepository _repository = PostRepository();

  XFile? pickedImage;
  TextEditingController textController = TextEditingController();
  FocusNode textFocusNode = FocusNode();

  resetData() {
    pickedImage = null;
    textController.clear();
  }

  pickImage() async {
    resetData();
    pickedImage = await pickImageFromGallery();
    notifyListeners();
  }

  uploadPost() {
    if (pickedImage == null) {
      debugPrint("AddPostViewModel::uploadPost - Picked image is null");
      return;
    }

    _repository.uploadPost(
      image: pickedImage!,
      content: textController.text,
    );
  }
}