import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();
  factory PreferencesService() => _instance;
  PreferencesService._internal();

  static PreferencesService get instance => _instance;

  SharedPreferences? _preferences;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    _preferences = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  Future<SharedPreferences> get preferences async {
    if (!_isInitialized || _preferences == null) {
      await initialize();
    }
    return _preferences!;
  }

  Future<bool?> getBool(String key) async {
    final prefs = await preferences;
    return prefs.getBool(key);
  }

  Future<bool> setBool(String key, bool value) async {
    final prefs = await preferences;
    return await prefs.setBool(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await preferences;
    return prefs.getString(key);
  }

  Future<bool> setString(String key, String value) async {
    final prefs = await preferences;
    return await prefs.setString(key, value);
  }

  Future<bool> setJson(String key, Map<String, dynamic> value) async {
    final prefs = await preferences;
    return await prefs.setString(key, jsonEncode(value));
  }

  Future<Map<String, dynamic>?> getJson(String key) async {
    final prefs = await preferences;
    final String? jsonString = prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  Future<int?> getInt(String key) async {
    final prefs = await preferences;
    return prefs.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    final prefs = await preferences;
    return await prefs.setInt(key, value);
  }

  Future<double?> getDouble(String key) async {
    final prefs = await preferences;
    return prefs.getDouble(key);
  }

  Future<bool> setDouble(String key, double value) async {
    final prefs = await preferences;
    return await prefs.setDouble(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final prefs = await preferences;
    return prefs.getStringList(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    final prefs = await preferences;
    return await prefs.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    final prefs = await preferences;
    return await prefs.remove(key);
  }

  Future<bool> clear() async {
    final prefs = await preferences;
    return await prefs.clear();
  }

  Future<bool> containsKey(String key) async {
    final prefs = await preferences;
    return prefs.containsKey(key);
  }

  Future<Set<String>> getKeys() async {
    final prefs = await preferences;
    return prefs.getKeys();
  }
}
