import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String cityName;
  final double temperature;
  final String weatherDescription;

  DetailPage({required this.cityName, required this.temperature, required this.weatherDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la ville'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Température: ${temperature.toStringAsFixed(1)}°C',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Météo: $weatherDescription',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
