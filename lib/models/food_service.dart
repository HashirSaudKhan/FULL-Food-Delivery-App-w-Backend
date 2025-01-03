import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:full_food_delivery_app_with_backend/models/food.dart';

class FoodService {
  static const String baseUrl =
      'http://localhost:3000'; // Replace with your actual server URL

  static Future<List<Food>> fetchBurgers() async {
    final response = await http.get(Uri.parse('$baseUrl/burgers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }

  static Future<List<Food>> fetchSalads() async {
    final response = await http.get(Uri.parse('$baseUrl/salads'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }

  static Future<List<Food>> fetchDesserts() async {
    final response = await http.get(Uri.parse('$baseUrl/desserts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }

  static Future<List<Food>> fetchSides() async {
    final response = await http.get(Uri.parse('$baseUrl/sides'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }

  static Future<List<Food>> fetchDrinks() async {
    final response = await http.get(Uri.parse('$baseUrl/drinks'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Food.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load burgers');
    }
  }
}
