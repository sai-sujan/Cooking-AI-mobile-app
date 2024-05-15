import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String _baseUrl = 'http://127.0.0.1:5000';

  Future<Map<String, dynamic>> fetchRecipeFromSearch(String query) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/recipe/from_search'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'search_query': query,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load recipe data:${response.statusCode}");
    }
  }
}