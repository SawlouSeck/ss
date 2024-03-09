import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:examl3gl/pages/DetailPage.dart';

class WeatherContainerData {
  final String cityName;
  final double temperature;
  final String weatherDescription;

  WeatherContainerData({required this.cityName, required this.temperature, required this.weatherDescription});
}

class DetailButton extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<DetailButton> {
  String apiKey = '5dbe3c91e7ed9661d3d77dba4df223cb';
  List<String> cities = ['Rennes', 'Paris', 'Nantes', 'Bordeaux', 'Lyon'];
  double progress = 0.0;
  String message = '';
  String message2 = '';
  List<WeatherContainerData> weatherContainers = []; // Liste pour stocker les conteneurs d'informations météorologiques

  @override
  void initState() {
    super.initState();
    startProgress();
  }

  Future<void> fetchWeatherData(String city) async {
    final response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> weatherData = jsonDecode(response.body);
      String cityName = weatherData['name'];
      double temperature = weatherData['main']['temp'] - 273.15; // Convert Kelvin to Celsius
      String weatherDescription = weatherData['weather'][0]['description'];

      setState(() {
        weatherContainers.add(WeatherContainerData(cityName: cityName, temperature: temperature, weatherDescription: weatherDescription));
      });
    } else {
      throw Exception('Failed to load weather data for $city');
    }
  }

  Future<void> startProgress() async {
    const duration = const Duration(seconds: 1);
    const totalSeconds = 60;
    int count = 0;
   
    List<String> waitingMessages = [
      'Nous téléchargeons les données...',
      'C’est presque fini...',
      'Plus que quelques secondes avant d’avoir le résultat...'
    ];

    Timer.periodic(duration, (Timer timer) async {
      setState(() {
        progress = count / totalSeconds;
      });

      if (progress >= 1.0) {
        timer.cancel();
        setState(() {
          message2 += 'Recommencer';
        });
        return;
      }

      setState(() {
        message = waitingMessages[count % waitingMessages.length];
      });

      if (count % 10 == 0 && count < cities.length * 10) {
        await fetchWeatherData(cities[count ~/ 10]);
      }

      count++;
      if (count > totalSeconds) {
        timer.cancel();
        setState(() {
          message += 'Toutes les données récupérées!';
        });
      }
    });
  }

  Container buildWeatherContainer(String cityName, double temperature, String weatherDescription) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage(cityName: cityName, temperature: temperature, weatherDescription: weatherDescription)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              'Temperature: ${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 2),
            Text(
              'Weather: $weatherDescription',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 234, 242),
      appBar: AppBar(
        title: Text('Weather Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6209CC),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 25, right: 25,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/temperature.png'),
              Text(message),
             
              Text(
                'Rainy weather expected around 04:00',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              LinearPercentIndicator(
                lineHeight: 20,
                percent: progress,
                progressColor: Color(0xFF6209CC),
                backgroundColor: Colors.white,
                animation: true,
                animationDuration: 1000,
                center: Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  for (var containerData in weatherContainers)
                    buildWeatherContainer(containerData.cityName, containerData.temperature, containerData.weatherDescription),
                ],
              ),
              Text(message2)
            ],
          ),
        ),
      ),
    );
  }
}
