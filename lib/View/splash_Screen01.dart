import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project2k34/Controller/FirstTimeCheck.dart';
import 'package:project2k34/View/Splash_screen2.dart';

class SplashScreen01 extends StatefulWidget {
  const SplashScreen01({super.key});
  @override
  State<SplashScreen01> createState() => _SplashScreen01State();
}

class _SplashScreen01State extends State<SplashScreen01> {
  @override
  Widget build(BuildContext cotext) {
    return Scaffold (
      backgroundColor:const Color.fromARGB(255, 255, 255, 255),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70,),
          Image.asset('assets/Images/splash-1.png'),
           Text(' "Welcome to VictoryVault " ',
          style: TextStyle(
            fontSize: 25,
            color: const Color.fromARGB(255, 7, 112, 198),
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 30,),
     Column(
  mainAxisAlignment: MainAxisAlignment.center,
  
  children: [
    Text(
      "A complete platform for sports registration, event updates, and score management",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  ],
)
,

          Container(
          height: 150,
            child: Image.asset("assets/Images/animation-1.png")),
  
        ],
      
        
        
      ),
      floatingActionButton:FloatingActionButton(
        backgroundColor:const Color.fromARGB(255, 44, 185, 216),
        onPressed: 
      ()async {
        await Firsttimecheck.setData(isfirsttime: false);
        log("Firsttimecheck.isfirsttime ${Firsttimecheck.enterfirsttime}");
                Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context){
              return SplashScreen02();


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