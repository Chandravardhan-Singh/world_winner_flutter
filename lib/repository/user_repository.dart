import 'dart:convert';
import 'package:world_winner_flutter/models/user.dart';
import 'package:world_winner_flutter/utils/storage/storage.dart';

class UserRepository {
  Future<User?> getUserFromStorage() {
    return Future.delayed(const Duration(seconds: 2), () async {
      //get user from storage

      final userString = await Storage.instance().get('user');
      if (userString != null) {
        User user = jsonDecode(userString);
        return user;
      } else {
        return null;
      }
    });
  }
}

class NetworkException implements Exception {}
