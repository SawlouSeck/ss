import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailButton
 extends StatelessWidget {
  const DetailButton
  ({super.key , });
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 219, 234, 242),
       appBar: AppBar(backgroundColor: Color(0xFF6209CC),),
       
       body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 300),
          
          Padding(padding: EdgeInsets.all(40)),
          
          Text('Rainy weather expected around 04:00'),
          LinearPercentIndicator(
            lineHeight: 40,
            percent: 0.5,
            progressColor: Color(0xFF6209CC), 
            backgroundColor: Colors.white,
            animation: true,
          )
        
        ]),
           
        )
       ),

    );
  }
}