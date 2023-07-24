import 'dart:convert';
import 'package:world_winner_flutter/models/user.dart';
import 'package:world_winner_flutter/utils/storage/storage.dart';

class UserRepository {
  Future<User?> getUserFromStorage() {
    return Future.delayed(const Duration(seconds: 2), () async {
      //get user from storage
      final userString = await Storage.instance().get('user');
      if (userString != null) {
        Map<String, dynamic> userJson = json.decode(userString);
        User user = User.fromJson(userJson);

        return user;
      } else {
        return null;
      }
    });
  }
}

class NetworkException implements Exception {}
