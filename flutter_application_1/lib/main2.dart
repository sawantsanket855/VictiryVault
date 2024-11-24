import "package:flutter/material.dart";
import "package:flutter_application_1/detailed_schedule.dart";
import "package:flutter_application_1/schedule.dart";
import "package:flutter_application_1/scorecard.dart";
import "package:flutter_application_1/scoring.dart";
import "./schedule_diagram.dart";
import './groups_final.dart';
import 'schedule1.dart';
import 'package:firebase_core/firebase_core.dart';
import './button.dart';
import 'scorecard.dart';
//  import "./groups.dart";
 void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "AIzaSyBqC9rE-6RV1GP-LaFAAjn_nqQKKNLQ7-w", appId: "1:992087814619:android:9cb13170e4a6e9f27df7fe", messagingSenderId: "992087814619", projectId: "victoryvault-71490"));
  // await initializeData();         //schedule
  await getScoreCardData();
  runApp(const MyApp());
  // getData();
 }

 class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      // home:ScheduleApp(),
      // home:Button(),
      home:ScoreCard()
    );
  }
 }