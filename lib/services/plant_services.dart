import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/plant.dart';

class PlantService {
  static const String apiUrl = 'https://www.jsonkeeper.com/b/6Z9C';

  Future<List<Plant>> fetchPlants() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List plantsList = jsonResponse['data'];
      return plantsList.map((data) => Plant.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load plants');
    }
  }
}
