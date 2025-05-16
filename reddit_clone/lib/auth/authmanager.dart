import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:reddit_clone/const/serverconst.dart';


class AuthManager {
  Future<dynamic> SignUp({
    required String username,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "password": password,
    };
    final response = await http.post(
      Uri.parse("${Serverconst().serverURL}/auth/signup"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Error";
    }
  }

  Future<dynamic> LogIn({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> data = {"email": email, "password": password};
    final response = await http.post(
      Uri.parse("${Serverconst().serverURL}/auth/login"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return "Error";
    }
  }
}
