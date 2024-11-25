import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2k34/Controller/FirstTimeCheck.dart';
import 'package:project2k34/Controller/SharedPrefrence.dart';
import 'package:project2k34/View/LoginPage.dart';
import 'package:project2k34/View/Query_msg.dart';
import 'package:project2k34/View/HomePages/adminHomePage.dart';
import 'package:project2k34/View/admin_home_page.dart';
import 'package:project2k34/View/dummyData/studentDummyData.dart';
import 'package:project2k34/View/register_Screen.dart';
import 'package:project2k34/View/scoring.dart';
// import 'package:project2k34/View/scoring_cricket.dart';
import 'package:project2k34/View/splash_Screen01.dart';
import 'package:project2k34/View/splash_screen.dart';
import 'package:project2k34/View/splash_screen03.dart';
import 'package:project2k34/View/HomePages/studentHomePage.dart';
import 'package:project2k34/View/uplode_demo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project2k34/View/create_schedule.dart';
import 'package:project2k34/View/scorecardNew.dart';
import 'package:project2k34/View/start_scoring_page.dart';
import 'package:project2k34/View/live_score.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await MySharedPrefrence.getData();  //important
  // await Firsttimecheck.getData();   //important


  
  // await getData("lU5WyOrEnTzKJwsi17pC","inning1");
  // await getScoreCardData();
  //  await initializeData();
  //  StudentDummyData().cricketpointTable();
  //  StudentDummyData().FootballPointTable();
  //  StudentDummyData().KabaddipointTable();


// await initializeData();
  await getMatchData();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget { 
  
  const MainApp({super.key});
  Widget nextScreen(){
    if(MySharedPrefrence.isLogin){
      return SplashScreen03();


      // if(MySharedPrefrence.myrole=='Admin'){
      //   log("Inside admin page");
      //   return const CommonHomePage();
      // }
      // else  if(MySharedPrefrence.myrole=='Department')
      // {
      //   log("Inside department page");
      //   return  adminHomePage();
      
      // }
      // else{
      //   log("Inside student page");
      //   return  studentHomeScreen();
      // }
    
    }
    else{
         if(Firsttimecheck.enterfirsttime){
          log("Inside splash screen");
             return const SplashScreen01();
         }
         else{
          return  const SplashScreen03();
         }
    }

  }
  @override
  Widget build(BuildContext context) {
    // log("${MySharedPrefrence.isLogin}");
    // log("${MySharedPrefrence.email}");
    // log("${MySharedPrefrence.name}");
    // log("${MySharedPrefrence.myrole}");
    // log("${Firsttimecheck.enterfirsttime}");
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: StartScoring() ,
    );
  }
}
