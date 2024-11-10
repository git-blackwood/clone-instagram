import 'dart:convert';
import 'dart:io';

import 'package:clone_instagram_app/constant.dart';
import 'package:image_picker/image_picker.dart';

class PostRepository {
  uploadPost({required XFile image, required String content}) async {
    // Todo: Need to implement upload image to db
    HttpClient client = HttpClient();
    HttpClientRequest request = await client.post(SERVER_HOST, SERVER_PORT, "/post");
    request.headers.contentType = ContentType.json;

    final body = {'param': 'Eunbyeol'};
    request.write(json.encode(body));

    HttpClientResponse response = await request.close();
    
    if (response.statusCode == HttpStatus.ok) {
      final responseBody = await response.transform(utf8.decoder).join();
      final parseResponse = json.decode(responseBody);
      print('POST parseResponse : $parseResponse');
    }
  } 
}