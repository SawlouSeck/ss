import 'package:examl3gl/pages/Jauge.dart';
import 'package:examl3gl/pages/detailsButton.dart';
import 'package:flutter/material.dart';

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
                SizedBox(height: 20), // Espacement entre les textes
                newMethod(context), // Utilisez la méthode ici
              ],
),

        ],
      ),
    );
  }

  Widget newMethod(BuildContext context) {
  return IconButton(
    onPressed: () {
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
}