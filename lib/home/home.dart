import 'package:examl3gl/home/BodySection.dart';
import 'package:examl3gl/home/HeaderSection.dart';
import 'package:examl3gl/home/nuage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFF6209CC),
     
      body: SingleChildScrollView(
         child: Stack(

            children: [
              Transform(transform: Matrix4.identity()
                ..rotateZ(20),
                origin: const Offset(150, 50),
                child: Image.asset(
                  'assets/images/bg_liquid.png',
                  width: 200, // Définissez la largeur de l'image ici
                ),),
              Positioned(
                right: 0,
                top: 200,
                child:
                Transform(transform: Matrix4.identity()
                  ..rotateZ(20),
                  origin: const Offset(150, 50),
                  child: Image.asset(
                    'assets/images/bg_liquid.png',
                    width: 1000, // Définissez la largeur de l'image ici
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 200,
                child:
                Transform(transform: Matrix4.identity()
                  ..rotateZ(20),
                  origin: const Offset(150, 30),
                  child: Image.asset(
                    'assets/images/bg_liquid.png',
                    width: 200, // Définissez la largeur de l'image ici
                  ),
                ),
              ),
              
              Column(
              children:[ HeaderSection(),
              BodySection(),
              ImageNuage()
               
               ]

              ),
            ],

          )
       ),
     bottomNavigationBar: NavigationBar(),
    );

  }
}

  Widget NavigationBar() {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                label: 'weather Data',
                icon: Icon(
                  Icons.sunny_snowing,
                  size: 50,
                ),
              ),
              BottomNavigationBarItem(
                label: "Maps",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.map,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "List",
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(72, 240, 228, 228).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.grey,
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

