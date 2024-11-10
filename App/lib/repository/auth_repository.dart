import 'dart:convert';
import 'dart:io';

import 'package:clone_instagram_app/constant.dart';

class AuthRepository {
  
  Future<bool> signIn({required String username, required String password}) async {
    final HttpClient client = HttpClient();
    final request = await client.post(SERVER_HOST, SERVER_PORT, "/auth/signin");
    request.headers.contentType = ContentType.json;

    final body = {
      "username": username,
      "password": password,
    };
    request.write(json.encode(body));

    final response = await request.close();

    if (response.statusCode == HttpStatus.created) {
      return true;
    } else {
      return false;
    }
  }
}