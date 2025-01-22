import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = "http://192.168.18.96:8001";

  // User login function
  static Future<String?> userLogin(String email, String password) async {
    final loginUrl = Uri.parse('$baseUrl/api/auth/login');

    try {
      final response = await http.post(
        loginUrl,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      } else {
        print('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Login error: $e');
    }
    return null; // Return null on failure
  }

  static Future<Map<String, dynamic>> getProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/profile'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Error fetching profile');
    }
  }
}
