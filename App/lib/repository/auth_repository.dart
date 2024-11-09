import 'dart:io';

import 'package:clone_instagram_app/constant.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  
  signIn({required String username, required String password}) async {
    final HttpClient client = HttpClient();
    final request = await client.post(SERVER_HOST, SERVER_PORT, "/auth/signin");
    final response = await request.close();
    debugPrint("AuthRepository::signIn - Response : $response");
  }
}