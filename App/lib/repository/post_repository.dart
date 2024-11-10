import 'dart:convert';
import 'dart:io';

import 'package:clone_instagram_app/constant.dart';
import 'package:clone_instagram_app/manager/user_manager.dart';
import 'package:image_picker/image_picker.dart';
import "package:http/http.dart" as http;

class PostRepository {
  uploadPost({required XFile image, required String content}) async {
    var url = Uri.http("$SERVER_HOST:$SERVER_PORT", "/post");
    var request = http.MultipartRequest("POST", url);
    request.fields['content'] = content;

    request.files.add(await http.MultipartFile.fromPath("file", image.path));
    
    var res = await request.send();
    print(res);
  } 
}