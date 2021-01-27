/*
 * Created Date: 1/26/21 6:19 PM
 * Author: Ahmed S.Omer
 *
 * Copyright (c) 2021 SafePass
 *
 */

import 'package:preferences/src/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_keys.dart';

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  SharedPreferencesService._internal();

  static Future<SharedPreferencesService> get instance async {
    if (_instance == null) {
      _instance = SharedPreferencesService._internal();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  /// saving the current user preferred theme mode.
  /// use [PrefsConstants.SYSTEM_THEME_MODE] => system settings mode.
  /// use [PrefsConstants.LIGHT_THEME_MODE] => light theme mode.
  /// use [PrefsConstants.DARK_THEME_MODE] => dark theme mode.
  Future<void> setThemeModeInfo(int themeMode) async =>
      await _preferences.setInt(SharedPrefKeys.themeMode, themeMode);

  int get themeModeInfo => _preferences.getInt(SharedPrefKeys.themeMode);

  Future<void> setAuthToken(String token) async =>
      await _preferences.setString(SharedPrefKeys.authToken, token);

  String get authToken => _preferences.getString(SharedPrefKeys.authToken);
}
