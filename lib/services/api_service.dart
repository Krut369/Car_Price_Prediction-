import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/car_input.dart';
import '../models/prediction_response.dart';

class ApiService {
  static const String baseUrl = "http://172.20.10.7:8000";

  static Future<PredictionResponse> predict(CarInput car) async {
    final response = await http.post(
      Uri.parse("$baseUrl/predict"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(car.toJson()),
    );

    if (response.statusCode == 200) {
      return PredictionResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to predict price");
    }
  }
}
