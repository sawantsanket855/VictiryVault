// import 'package:flutter/material.dart';
// import 'package:project2k34/View/LoginPage.dart';

// class SplashScreen03 extends StatelessWidget {
//   const SplashScreen03({super.key});
//   void  stopForSomeTime(BuildContext context) {
//     Future.delayed(
//       Duration(
//         seconds: 3
//       ),
//       (){
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context){
//               return LoginScreen();
//             }
//           )
//         );
//       }
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     stopForSomeTime(context);
//     return   Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset("assets/Images/victory1.png"),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/LoginPage.dart';
import 'package:project2k34/View/HomePages/adminHomePage.dart';
import 'package:project2k34/View/admin_home_page.dart';
import 'package:project2k34/View/HomePages/department_home_page.dart';
import 'package:project2k34/View/schedule_diagram1.dart';
import 'package:project2k34/View/HomePages/studentHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen03 extends StatelessWidget {
  const SplashScreen03({super.key});
  Widget nextScreen(){
    if(MySharedPrefrence.isLogin){
     if(MySharedPrefrence.myrole.toLowerCase()=='admin'){
        log("Inside admin page");
             return  adminHomePage();
      
      }
      else  if(MySharedPrefrence.myrole.toLowerCase()=='department')
      {
        log("Inside department page");
       
          return  DepartmentHomePage();

      }
      else{
        log("Inside student page");
        return  studentHomeScreen();
      }
    }
    else{
      return LoginScreen();
    }
   
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedSplashScreen(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        pageTransitionType: PageTransitionType.leftToRight,
        animationDuration: Duration(seconds: 1),
        splashIconSize: 500,
        splashTransition:SplashTransition.scaleTransition ,
        splash: 
      Container(
        child: Image.asset("assets/Images/victory1.png")),
      
      nextScreen:nextScreen()
      )

      
    );
  }
}