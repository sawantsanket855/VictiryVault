import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[const Color.fromARGB(255, 94, 1, 1),Colors.red])
        ),
        child: Column(
          children: [
            SizedBox(height: 70,),
            Text(" VictoryVault",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white
            ),)
          ],
        ),

      ),
    );
   
  }
}