import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  const Storage._sharedInstances();
  static const Storage _shared = Storage._sharedInstances();
  factory Storage.instance() => _shared;

  final _storage = const FlutterSecureStorage();

  void add(String key, String value) {
    _storage.write(key: key, value: value);
  }

  void remove(String key) async {
    return await _storage.delete(key: key);
  }

  Future<String?> get(String key) async {
    return await _storage.read(key: key);
  }
}
