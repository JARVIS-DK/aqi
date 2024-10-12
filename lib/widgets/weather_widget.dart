import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatefulWidget {
  final DateTime now;
  WeatherWidget({required this.now});

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 30,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Coimbatore',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    DateFormat('EEEE, d MMMM y').format(widget.now),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              forecastDetail(FontAwesomeIcons.umbrella, '30%', 'Precipitation'),
              forecastDetail(Icons.wb_sunny, '20%', 'Sunshine'),
              forecastDetail(Icons.cloud, '50%', 'Cloudiness'),
            ],
          ),
          const SizedBox(height: 35),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildWeatherCard("11:00", "sunny", "36°"),
                buildWeatherCard("12:00", "sunny", "32°"),
                buildWeatherCard("1:00", "cloudy", "22°"),
                buildWeatherCard("2:00", "rainy", "19°"),
                buildWeatherCard("3:00", "mist", "26°"),
                buildWeatherCard("4:00", "snow", "13°"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeatherCard(String time, String icon, String temperature) {
    Map<String, String> emojis = {
      'sunny': "☀️",
      'rainy': "🌧️",
      'cloudy': "⛅",
      'mist': "🌫️",
      'snow': "🌨️"
    };
    String? emoji = emojis[icon] ?? "🌞";

    return Container(
      width: 65,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigoAccent, Colors.blue.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            emoji,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            temperature,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget forecastDetail(IconData icon, String value, String label) {
    return Container(
      width: 90,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade800, Colors.grey.shade900],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 5),
          Text(value, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget forecastIcon(String time, IconData icon) {
    return Column(
      children: [
        Text(time, style: TextStyle(color: Colors.white70)),
        SizedBox(height: 10),
        Icon(icon, color: Colors.orange, size: 32),
      ],
    );
  }
}
