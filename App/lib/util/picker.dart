import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromGallery() async {
  final ImagePicker _imagePicker = ImagePicker();
  return await _imagePicker.pickImage(source: ImageSource.gallery);
}