import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://betmaster-api.onrender.com';

  String? authToken; // Variable to store the authentication token

  Future<Map<String, dynamic>> login(String username, String password) async {
    final String apiUrl = '$baseUrl/api/auth/login';

    final Map<String, dynamic> loginData = {
      'username': username,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginData),
    );

    print('Request: ${jsonEncode(loginData)}'); // Adicione esta linha
    print('Response: ${response.body}'); // Adicione esta linha

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      authToken = responseData['token'];
      return {'success': true, 'data': responseData};
    } else {
      // Exiba a resposta da API quando o login falhar
      print('Erro de Login: ${response.statusCode} - ${response.body}');
      return {'success': false, 'error': 'Login failed'};
    }
  }
   Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final String apiUrl = '$baseUrl/api/auth/register';

    final Map<String, dynamic> registerData = {
      'username': username,
      'email': email,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(registerData),
    );

    print('Request: ${jsonEncode(registerData)}');
    print('Response: ${response.body}');

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      authToken = responseData['token'];
      return {'success': true, 'data': responseData};
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return {'success': false, 'error': 'Registration failed'};
    }
  }
}
