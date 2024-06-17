import 'dart:async';

import 'package:network/core/shared_preferences/preferences.dart';

class SharedPreferenceHelper {
  final Preference _sharedPreference;

  const SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreference.setString(PrefKeys.authToken, authToken);
  }

  String? get authToken {
    return _sharedPreference.getString(PrefKeys.authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(PrefKeys.authToken);
  }

  Future<void> saveUserId(String userId) async {
    await _sharedPreference.setString(PrefKeys.userId, userId);
  }

  String? get userId {
    return _sharedPreference.getString(PrefKeys.userId);
  }

  Future<void> saveUserName(String userName) async {
    await _sharedPreference.setString(PrefKeys.userName, userName);
  }

  String? get userName {
    return _sharedPreference.getString(PrefKeys.userName);
  }

  Future<void> saveEmail(String email) async {
    await _sharedPreference.setString(PrefKeys.email, email);
  }

  String? get email {
    return _sharedPreference.getString(PrefKeys.email);
  }

  Future<void> saveRoleId(String roleId) async {
    await _sharedPreference.setString(PrefKeys.roleId, roleId);
  }

  String? get roleId {
    return _sharedPreference.getString(PrefKeys.roleId);
  }

  Future<void> saveRoleName(String roleName) async {
    await _sharedPreference.setString(PrefKeys.roleName, roleName);
  }

  String? get roleName {
    return _sharedPreference.getString(PrefKeys.roleName);
  }

  Future<void> saveIsLoggedIn(bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreference.clear();
  }

  Future<void> saveLanguageCode(String langCode) async {
    switch (langCode) {
      case 'ar':
        await _sharedPreference.setString(PrefKeys.languageCode, AppLocal.ar.name);
        break;
      case 'en':
        await _sharedPreference.setString(PrefKeys.languageCode, AppLocal.en.name);
        break;
      default:
        await _sharedPreference.setString(PrefKeys.languageCode, AppLocal.ar.name);
    }
  }

  String get languageCode {
    final langCode = _sharedPreference.getString(PrefKeys.languageCode);
    switch (langCode) {
      case "en":
        return AppLocal.en.name;
      case "ar":
        return AppLocal.ar.name;
      default:
        return AppLocal.ar.name;
    }
  }
}

mixin PrefKeys {
  static const String isLoggedIn = "isLoggedIn";
  static const String authToken = "authToken";
  static const String userId = "userId";
  static const String languageCode = 'languageCode';
  static const String userName = 'userName';
  static const String email = 'email';
  static const String roleId = 'roleId';
  static const String roleName = 'roleName';
}

enum AppLocal { en, ar }
