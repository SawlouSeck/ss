import 'package:examl3gl/pages/Jauge.dart';
import 'package:examl3gl/pages/detailsButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BodySection extends StatelessWidget {
  const BodySection({Key? key});
  
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.amber,
      padding: EdgeInsets.all(20), // Ajout de padding pour un meilleur espacement
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical
        crossAxisAlignment: CrossAxisAlignment.center, // Centrage horizontal
        children: [
          Text(
            'Washington',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10), // Espacement entre les textes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud, color: Colors.white, size: 30), // Icone météo
              SizedBox(width: 10), // Espacement
              Text(
                '6°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Espacement entre les textes
          Text(
            'Time Clear',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20), // Espacement entre les textes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'High⭡: 9°  ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Low⭣: 0°',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20), // Espacement entre les textes
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Details', style: TextStyle( color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,)),
                SizedBox(height: 20), 
                newMethod(context), 
              ],
),

        ],
      ),
    );
  }

  Widget newMethod(BuildContext context) {
  return IconButton(
    onPressed: () {
     // fetchData();
      // Navigation vers la prochaine page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailButton( )),
      );
    },
    icon: Icon(Icons.light_mode),
    color: Colors.white,
    iconSize: 30,
  );
}
  /* Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=France&limit=5&appid=5dbe3c91e7ed9661d3d77dba4df223cb'));
    if (response.statusCode == 200) {
     setState(() {
        data = json.decode(response.body)['title'];
      });
      print(response.body);
    } 
    else{
      print(response.statusCode);
    }
  }*/
}