import 'package:flutter/material.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
              "YOUR_WEATHER_2.0",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Weather in your city",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
                    ],
                  ),
         CircleAvatar(backgroundColor: const Color.fromARGB(255, 87, 164, 228),
           child:  Image.asset('assets/images/nuage.webp'),
         ),
        ],
      ),
    );
  }
}
