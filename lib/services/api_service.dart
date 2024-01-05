import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'http://localhost:60810'; // Endereço base da API

  Future<Map<String, dynamic>> request(String endpoint, {required String method, Map<String, dynamic>? data}) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    late http.Response response;

    switch (method.toUpperCase()) {
      case 'GET':
        response = await http.get(url);
        break;
      case 'POST':
        response = await http.post(url, body: data);
        break;
      // Adicione mais casos conforme necessário para outros métodos (PUT, DELETE, etc.)
      default:
        throw Exception('Unsupported HTTP method: $method');
    }

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed request: ${response.statusCode}');
    }
  }
}
