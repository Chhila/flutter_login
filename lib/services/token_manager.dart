import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static Future<void> saveCredentials(String email, String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authEmail', email);
    await prefs.setString('authToken', token);
  }

  static Future<Map<String, String?>> getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('authEmail'),
      'token': prefs.getString('authToken'),
    };
  }

  static Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('authEmail');
    await prefs.remove('authToken');
  }
}
