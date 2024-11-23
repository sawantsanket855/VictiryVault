import 'package:flutter/material.dart';
import 'package:project2k34/View/splash_screen.dart';
import 'package:project2k34/View/splash_screen03.dart';

class SplashScreen02 extends StatefulWidget {
  const SplashScreen02({super.key});

  @override
  State<SplashScreen02> createState() => _SplashScreen02State();
}

class _SplashScreen02State extends State<SplashScreen02> {
  @override
  Widget build(BuildContext cotext) {
    return Scaffold (
      backgroundColor:const Color.fromARGB(255, 255, 255, 255),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Image.asset('assets/Images/splash02.jpg'),
             Text(' " VictoryVault " ',
            style: TextStyle(
              fontSize: 35,
              color: const Color.fromARGB(255, 7, 112, 198),
              fontWeight: FontWeight.w900
            ),),
            SizedBox(height: 30,),
             Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text(
        "For managing events and updating scorecards and Register for upcoming sports events",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
            ),
          ],
        )
        ,
        
            Container(
              height: 250,
              child: Image.asset("assets/Images/logo02.png"),),
          ],
        
          
          
        ),
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:const Color.fromARGB(255, 44, 185, 216),
        onPressed: 
      (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context){
              return SplashScreen03();


            },
          )
        );


      }
      ,
      child: const Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
        
      ),
      ),
    );
  }
}