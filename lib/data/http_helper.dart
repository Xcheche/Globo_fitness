import 'package:http/http.dart' as http;
import 'dart:convert';

import '../weather.dart';

class HttpHelper {
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apikey = '2bef00a2ab3a719f2ea5d9d296cb984c';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {
      'q': location,
      'appid': apikey,
    };

    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);

    if (result.statusCode == 200) {
      Map<String, dynamic> data = json.decode(result.body);
      Weather weather = Weather.fromJson(data);
      return weather;
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
