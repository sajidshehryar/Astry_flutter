import 'dart:convert';
import 'dart:ffi';

import 'package:get_storage/get_storage.dart';


class StorageHelper{

  static late GetStorage getStorage;

  static const String _userType = "userType";
  static const String _userId = "userId";
  static const String _userToken = "userToken";
  static const String _userModel = "userModel";

  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');


  _savePref(String key, Object? value) async {
    var prefs = getStorage;
    if (prefs.hasData(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.write(key, value);
    } else if (value is int) {
      return prefs.write(key, value);
    } else if (value is String) {
      return prefs.write(key, value);
    } else if (value is Double || value is Float) {
      return prefs.write(key, value as double);
    }
  }

  T _getPref<T>(String key) {
    return getStorage.read(key) as T;
  }


  void clearAll() {
    getStorage.erase();
  }

  String? getUserType() {
    return _getPref(_userType);
  }

  void saveUserType(String? value) {
    _savePref(_userType, value);
  }


  String? getUserToken() {
    return _getPref(_userToken);
  }

  void saveUserToken(String? token) {
    _savePref(_userToken, token);
  }

  int? getUserId() {
    return _getPref(_userId);
  }

  void saveUserId(int? userId) {
    _savePref(_userId, userId);
  }
}