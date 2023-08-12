import 'package:flutter/material.dart';

import '../data/http_helper.dart';
import '../weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({required Key key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController(text: 'Lagos');
  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: txtPlace,
                decoration: InputDecoration(
                  hintText: 'Enter a city',
                  suffixIcon: IconButton(
                    onPressed: getData,
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                result.name.isEmpty
                    ? 'Enter a city to see the weather.'
                    : 'Weather in ${result.name}: ${result.description}, Temperature: ${result.temperature}°C',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getData() async {
    try {
      HttpHelper helper = HttpHelper();
      Weather data = await helper
          .getWeather(txtPlace.text); // Fetch weather for the entered city

      if (data != null && data.name.isNotEmpty && data.description.isNotEmpty) {
        setState(() {
          result = data;
        });
      } else {
        setState(() {
          result = Weather('', 'Error fetching weather data.', 0, 0, 0, 0);
        });
      }
    } catch (error) {
      setState(() {
        result = Weather('', 'Error fetching weather data.', 0, 0, 0, 0);
      });
    }
  }
}
