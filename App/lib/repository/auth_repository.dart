import 'dart:convert';
import 'dart:io';
import 'package:clone_instagram_app/manager/user_manager.dart';
import 'package:http/http.dart' as http;

import 'package:clone_instagram_app/constant.dart';

class AuthRepository {
  
  Future<bool> signIn({required String username, required String password}) async {
    var url = Uri.http("$SERVER_HOST:$SERVER_PORT", "/auth/signin");
    var response = await http.post(url, body: { "username": username, "password": password });

    if (response.statusCode == HttpStatus.created) {
      UserManager().accessToken = jsonDecode(response.body)["accessToken"];
      return true;
    } else {
      return false;
    }
  }
}